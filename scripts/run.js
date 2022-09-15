const main = async () => {
    const [owner, randomPerson] = await hre.ethers.getSigners();
//   const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
//   const waveContract = await waveContractFactory.deploy();
//   await waveContract.deployed();

//   console.log("Contract deployed to:", waveContract.address);
//   console.log("Contract deployed by:", owner.address);


//   let waveCount;
//   waveCount = await waveContract.getTotalWaves();

//   let waveTxn = await waveContract.wave();
//   await waveTxn.wait();

//   waveCount = await waveContract.getTotalWaves();

//   let waveTxn1 = await waveContract.wave();
//   await waveTxn1.wait();

//   waveCount = await waveContract.getTotalWaves();

//   let randomUser1 = await waveContract.connect(randomPerson).wave()
//   await randomUser1.wait();

//   waveCount = await waveContract.getTotalWaves();
//   console.log(waveCount);

//   let waveCount;
//   waveCount = await waveContract.getTotalWaves();
//   console.log(waveCount.toNumber());

//   /**
//    * Let's send a few waves!
//    */
//   let waveTxn = await waveContract.wave("A message!");
//   await waveTxn.wait(); // Wait for the transaction to be mined

//   waveTxn = await waveContract.connect(randomPerson).wave("Another message!");
//   await waveTxn.wait(); // Wait for the transaction to be mined

//   let allWaves = await waveContract.getAllWaves();
//   console.log(allWaves);

//   


const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
  const waveContract = await waveContractFactory.deploy({
    value: hre.ethers.utils.parseEther("0.1"),
  });
  await waveContract.deployed();
  console.log("Contract addy:", waveContract.address);

  /*
   * Get Contract balance
   */
//   let contractBalance = await hre.ethers.provider.getBalance(
//     waveContract.address
//   );
//   console.log(
//     "Contract balance:",
//     hre.ethers.utils.formatEther(contractBalance)
//   );

//   /*
//    * Send Wave
//    */
//   let waveTxn = await waveContract.wave("A message!");
//   await waveTxn.wait();

//   /*
//    * Get Contract balance to see what happened!
//    */
//   contractBalance = await hre.ethers.provider.getBalance(waveContract.address);
//   console.log(
//     "Contract balance:",
//     hre.ethers.utils.formatEther(contractBalance)
//   );

//   let allWaves = await waveContract.getAllWaves();
//   console.log(allWaves);


 /*
   * Let's try two waves now
   */
 const waveTxn = await waveContract.wave("This is wave #1");
 await waveTxn.wait();

 contractBalance = await hre.ethers.provider.getBalance(waveContract.address);
 console.log(
   "Contract balance: wave 1",
   hre.ethers.utils.formatEther(contractBalance)
 );

 const waveTxn2 = await waveContract.wave("This is wave #2");
 await waveTxn2.wait();

 contractBalance = await hre.ethers.provider.getBalance(waveContract.address);
 console.log(
   "Contract balance: wave 2",
   hre.ethers.utils.formatEther(contractBalance)
 );

 let allWaves = await waveContract.getAllWaves();
 console.log(allWaves);
  

  
};

const runMain = async () => {
  try {
    await main();
    process.exit(0); // exit Node process without error
  } catch (error) {
    console.log(error);
    process.exit(1); // exit Node process while indicating 'Uncaught Fatal Exception' error
  }
  // Read more about Node exit ('process.exit(num)') status codes here: https://stackoverflow.com/a/47163396/7974948
};

runMain();