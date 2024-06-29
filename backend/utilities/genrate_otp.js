function genrateOtp(){
    console.log(Math.floor(1000 + Math.random() * 9000));
    return Math.floor(1000 + Math.random() * 9000);
}

module.exports = {
    genrateOtp,
}