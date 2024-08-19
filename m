Return-Path: <linux-omap+bounces-1923-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7EE956756
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2024 11:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5794282B69
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2024 09:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4234815D5B8;
	Mon, 19 Aug 2024 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="MXEnQnyV";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="JkyTqpWh"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC92615CD6A;
	Mon, 19 Aug 2024 09:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724060645; cv=none; b=p1FiRRM5bc1206TjSKlqwNcn6dlJwSxD0JtMYV31EwjDeaE5WgjSUDsW4djWgbh7w+hfcBLvWB/WXvUu92B+AB3UAdmZNv0fhUrupER5BIyni3LFNd6kduaM8QDEQQy/OCIESEIKy2OpNDDX+hlqNJg38Z598TJY6eJ4GQfnWrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724060645; c=relaxed/simple;
	bh=ebTkuDAjz17jOERcCI/zrYU1jNCdYClPr2oOK7LJOTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HSfw7/MZwqF5vdLf5xRzvYAu+e8dnL3Zy81gYbRuipMXqUM0DUTlcvwYKNNkfDbWwjrCaAPEQqOqt39E1Tty+pXbs2ol3iXTr4Ji0JXUHEDJrm6KfjqNThmdvHdap02FerigU9j40ecOh+2SBGJdejLgcmE5ONNsEyhfW9Kkh0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=MXEnQnyV; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=JkyTqpWh reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1724060643; x=1755596643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ngGTJT88bhTDzobjsAMP4AG2gDq4amUpHxaFrPSBc4k=;
  b=MXEnQnyV9H0r8Y9mKWQxaKLr2xb0o7hkmdD/OZhmdaLZCBVWqZbf9KBg
   2Q05css+2tKNzXIJohcZQ79wqnKzvHFKCCNP5WGwB+NEKYrkSS7GwSDSb
   xWQvon9g/bOoJr22kkX4beC5hhU1Oo3vp95ircI3dQmCork53D5OCI5IZ
   S86WSodi0WCBWtJOr+hEOv2oYaM18qyrVIFwIs9Z0Pb2Wv0EyYs73j90H
   iBHHHCngpqdmfKZwAMn8GZt9nVsVMACH+ORlf/mrFCXvsES83BZVBvyc5
   rutp4H0gLU3UhFNo42v0aw8rPOCZzaWdWk3iK2HZXoFMH5oQ1TBgB/eza
   Q==;
X-CSE-ConnectionGUID: yCgMkliYQv6PzqBi7yuoUA==
X-CSE-MsgGUID: gxuYcJWEQbyRcMpE/DEJ4A==
X-IronPort-AV: E=Sophos;i="6.10,158,1719871200"; 
   d="scan'208";a="38463688"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Aug 2024 11:44:00 +0200
X-CheckPoint: {66C313E0-17-78509F09-E532FC2E}
X-MAIL-CPID: 528803B12FE86B34AF661D7848C520CB_1
X-Control-Analysis: str=0001.0A782F16.66C313E0.0162,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1956C166864;
	Mon, 19 Aug 2024 11:43:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1724060635;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ngGTJT88bhTDzobjsAMP4AG2gDq4amUpHxaFrPSBc4k=;
	b=JkyTqpWhXT9Lb8O2XYwT6AQvDQde8ZTKDVNPhZlmm3ttRrRCKEOSK9EPy7VCHHBTD7YhTI
	aNy5zmKjh3iimOvA84m0X9FKXFKJJaTUErjzBahlHQB8B5AT/bMjOaLxjF/bIYUwRoe8fZ
	oRCbB3LUd4vMV5jHlyfLh3/uBqXw2XEf90sDqkAKhKICWghjKA8RKKmKchzIGl9rx6S6zx
	9uMJgtNhtk4j08YtANi84BxFboafG4oqwMIIC+BIS2CUlrfOTHGnSP2bg8pyZWCjpWbDo8
	a/EpyFNDE5Snhyo6NKMWlKdWI2NR85ugo5boIRQBYvQKo4n0EgEC1/G8MMomsA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: soc@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Dinh Nguyen <dinguyen@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Mark Jackson <mpfj@newflow.co.uk>, Tony Lindgren <tony@atomide.com>, Michal Simek <michal.simek@amd.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, imx@lists.linux.dev, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: Fix undocumented LM75 compatible nodes
Date: Mon, 19 Aug 2024 11:43:51 +0200
Message-ID: <4592015.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240816164717.1585629-1-robh@kernel.org>
References: <20240816164717.1585629-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Rob,

thanks for the update.

Am Freitag, 16. August 2024, 18:47:14 CEST schrieb Rob Herring (Arm):
> "lm75" without any vendor is undocumented. It works with the Linux
> kernel since the I2C subsystem will do matches of the compatible string
> without a vendor prefix to the i2c_device_id and/or driver name.
>=20
> Mostly replace "lm75" with "national,lm75" as that's the original part
> vendor and the compatible which matches what "lm75" matched with. In a
> couple of cases the node name or compatible gives a clue to the actual
> part and vendor and a more specific compatible can be used. In these
> cases, it does change the variant the kernel picks.
>=20
> "nct75" is an OnSemi part which is compatible with TI TMP75C based on
> a comparison of the OnSemi NCT75 datasheet and configuration the Linux
> driver uses. Adding an OnSemi compatible would be an ABI change.
>=20
> "nxp,lm75" is most likely an NXP part. Alexander Stein says the i.MX53
> boards are a NXP LM75A as well. NXP makes a LM75A and LM75B. Both are
> 11-bit resolution and 100ms sample time. The "national,lm75a" is
> 9-bit, so "national,lm75b" is the closest match for both NXP variants.
>=20
> While we're here, fix the node names to use the generic name
> "temperature-sensor".
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com> # am335x-nano.dts
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx53-mba5=
3.dts, imx53-tqma53.dtsi

> ---
> SoC maintainers, Please take this directly for v6.12.
>=20
> v2:
>  - Also use "national,lm75b" on i.MX53 boards.
> ---
>  .../aspeed/aspeed-bmc-facebook-greatlakes.dts |  2 +-
>  .../socfpga/socfpga_cyclone5_vining_fpga.dts  |  4 +--
>  .../dts/marvell/armada-385-clearfog-gtr.dtsi  |  8 ++---
>  .../boot/dts/nuvoton/nuvoton-npcm730-kudo.dts | 32 +++++++++----------
>  .../boot/dts/nuvoton/nuvoton-npcm750-evb.dts  |  6 ++--
>  arch/arm/boot/dts/nxp/imx/imx53-mba53.dts     |  4 +--
>  arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi   |  4 +--
>  .../dts/nxp/lpc/lpc4357-ea4357-devkit.dts     |  4 +--
>  .../boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts  |  2 +-
>  arch/arm/boot/dts/ti/omap/am335x-nano.dts     |  2 +-
>  .../boot/dts/xilinx/zynq-zturn-common.dtsi    |  4 +--
>  11 files changed, 36 insertions(+), 36 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts =
b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
> index 998598c15fd0..49914a4a179f 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
> @@ -201,7 +201,7 @@ eeprom@54 {
>  &i2c12 {
>  	status =3D "okay";
>  	temperature-sensor@4f {
> -		compatible =3D "lm75";
> +		compatible =3D "national,lm75";
>  		reg =3D <0x4f>;
>  	};
>  };
> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga=
=2Edts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dts
> index 65f390bf8975..84f39dec3c42 100644
> --- a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dts
> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dts
> @@ -130,8 +130,8 @@ gpio: pca9557@1f {
>  		#gpio-cells =3D <2>;
>  	};
> =20
> -	temp: lm75@48 {
> -		compatible =3D "lm75";
> +	temp: temperature-sensor@48 {
> +		compatible =3D "national,lm75";
>  		reg =3D <0x48>;
>  	};
> =20
> diff --git a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi b/arc=
h/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
> index f3a3cb6ac311..8208c6a9627a 100644
> --- a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
> @@ -423,14 +423,14 @@ &i2c0 {
>  	status =3D "okay";
> =20
>  	/* U26 temperature sensor placed near SoC */
> -	temp1: nct75@4c {
> -		compatible =3D "lm75";
> +	temp1: temperature-sensor@4c {
> +		compatible =3D "ti,tmp75c";
>  		reg =3D <0x4c>;
>  	};
> =20
>  	/* U27 temperature sensor placed near RTC battery */
> -	temp2: nct75@4d {
> -		compatible =3D "lm75";
> +	temp2: temperature-sensor@4d {
> +		compatible =3D "ti,tmp75c";
>  		reg =3D <0x4d>;
>  	};
> =20
> diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts b/arch/ar=
m/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
> index 1f07ba382910..886a87dfcd0d 100644
> --- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
> +++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
> @@ -531,8 +531,8 @@ i2c@4 {
>  			reg =3D <4>;
> =20
>  			// INLET1_T
> -			lm75@5c {
> -				compatible =3D "ti,lm75";
> +			temperature-sensor@5c {
> +				compatible =3D "national,lm75";
>  				reg =3D <0x5c>;
>  			};
>  		};
> @@ -543,8 +543,8 @@ i2c@5 {
>  			reg =3D <5>;
> =20
>  			// OUTLET1_T
> -			lm75@5c {
> -				compatible =3D "ti,lm75";
> +			temperature-sensor@5c {
> +				compatible =3D "national,lm75";
>  				reg =3D <0x5c>;
>  			};
>  		};
> @@ -555,8 +555,8 @@ i2c@6 {
>  			reg =3D <6>;
> =20
>  			// OUTLET2_T
> -			lm75@5c {
> -				compatible =3D "ti,lm75";
> +			temperature-sensor@5c {
> +				compatible =3D "national,lm75";
>  				reg =3D <0x5c>;
>  			};
>  		};
> @@ -567,8 +567,8 @@ i2c@7 {
>  			reg =3D <7>;
> =20
>  			// OUTLET3_T
> -			lm75@5c {
> -				compatible =3D "ti,lm75";
> +			temperature-sensor@5c {
> +				compatible =3D "national,lm75";
>  				reg =3D <0x5c>;
>  			};
>  		};
> @@ -697,8 +697,8 @@ i2c@3 {
>  			reg =3D <3>;
> =20
>  			// M2_ZONE_T
> -			lm75@28 {
> -				compatible =3D "ti,lm75";
> +			temperature-sensor@28 {
> +				compatible =3D "national,lm75";
>  				reg =3D <0x28>;
>  			};
>  		};
> @@ -709,8 +709,8 @@ i2c@4 {
>  			reg =3D <4>;
> =20
>  			// BATT_ZONE_T
> -			lm75@29 {
> -				compatible =3D "ti,lm75";
> +			temperature-sensor@29 {
> +				compatible =3D "national,lm75";
>  				reg =3D <0x29>;
>  			};
>  		};
> @@ -721,8 +721,8 @@ i2c@5 {
>  			reg =3D <5>;
> =20
>  			// NBM1_ZONE_T
> -			lm75@28 {
> -				compatible =3D "ti,lm75";
> +			temperature-sensor@28 {
> +				compatible =3D "national,lm75";
>  				reg =3D <0x28>;
>  			};
>  		};
> @@ -732,8 +732,8 @@ i2c@6 {
>  			reg =3D <6>;
> =20
>  			// NBM2_ZONE_T
> -			lm75@29 {
> -				compatible =3D "ti,lm75";
> +			temperature-sensor@29 {
> +				compatible =3D "national,lm75";
>  				reg =3D <0x29>;
>  			};
>  		};
> diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dts b/arch/arm=
/boot/dts/nuvoton/nuvoton-npcm750-evb.dts
> index f53d45fa1de8..bcdcb30c7bf6 100644
> --- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dts
> +++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dts
> @@ -198,7 +198,7 @@ &i2c0 {
>  	clock-frequency =3D <100000>;
>  	status =3D "okay";
>  	lm75@48 {
> -		compatible =3D "lm75";
> +		compatible =3D "national,lm75";
>  		reg =3D <0x48>;
>  		status =3D "okay";
>  	};
> @@ -208,8 +208,8 @@ lm75@48 {
>  &i2c1 {
>  	clock-frequency =3D <100000>;
>  	status =3D "okay";
> -	lm75@48 {
> -		compatible =3D "lm75";
> +	temperature-sensor@48 {
> +		compatible =3D "national,lm75";
>  		reg =3D <0x48>;
>  		status =3D "okay";
>  	};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts b/arch/arm/boot/dt=
s/nxp/imx/imx53-mba53.dts
> index 2117de872703..0d336cbdb451 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
> @@ -175,8 +175,8 @@ expander: pca9554@20 {
>  		gpio-controller;
>  	};
> =20
> -	sensor2: lm75@49 {
> -		compatible =3D "lm75";
> +	sensor2: temperature-sensor@49 {
> +		compatible =3D "national,lm75b";
>  		reg =3D <0x49>;
>  	};
>  };
> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi b/arch/arm/boot/=
dts/nxp/imx/imx53-tqma53.dtsi
> index b2d7271d1d24..c34ee84bd716 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi
> @@ -254,8 +254,8 @@ pmic: mc34708@8 {
>  		interrupts =3D <6 4>; /* PATA_DATA6, active high */
>  	};
> =20
> -	sensor1: lm75@48 {
> -		compatible =3D "lm75";
> +	sensor1: temperature-sensor@48 {
> +		compatible =3D "national,lm75b";
>  		reg =3D <0x48>;
>  	};
> =20
> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts b/arch/a=
rm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts
> index 224f80a4a31d..4aefbc01dfc0 100644
> --- a/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts
> +++ b/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts
> @@ -482,8 +482,8 @@ mma7455@1d {
>  		reg =3D <0x1d>;
>  	};
> =20
> -	lm75@48 {
> -		compatible =3D "nxp,lm75";
> +	temperature-sensor@48 {
> +		compatible =3D "national,lm75b";
>  		reg =3D <0x48>;
>  	};
> =20
> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts b/arch/arm=
/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
> index 1f84654df50c..846afb8ccbf1 100644
> --- a/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
> +++ b/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
> @@ -511,7 +511,7 @@ &i2c1 {
>  	clock-frequency =3D <400000>;
> =20
>  	sensor@49 {
> -		compatible =3D "lm75";
> +		compatible =3D "national,lm75";
>  		reg =3D <0x49>;
>  	};
> =20
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-nano.dts b/arch/arm/boot/dt=
s/ti/omap/am335x-nano.dts
> index 26b5510cb3d1..56929059f5af 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-nano.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-nano.dts
> @@ -231,7 +231,7 @@ tps: tps@24 {
>  	};
> =20
>  	temperature-sensor@48 {
> -		compatible =3D "lm75";
> +		compatible =3D "national,lm75";
>  		reg =3D <0x48>;
>  	};
> =20
> diff --git a/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi b/arch/arm/b=
oot/dts/xilinx/zynq-zturn-common.dtsi
> index dfb1fbafe3aa..33b02e05ce82 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi
> +++ b/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi
> @@ -97,9 +97,9 @@ &i2c0 {
>  	status =3D "okay";
>  	clock-frequency =3D <400000>;
> =20
> -	stlm75@49 {
> +	temperature-sensor@49 {
>  		status =3D "okay";
> -		compatible =3D "lm75";
> +		compatible =3D "st,stlm75";
>  		reg =3D <0x49>;
>  	};
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



