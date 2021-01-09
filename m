Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 348712F01F0
	for <lists+linux-omap@lfdr.de>; Sat,  9 Jan 2021 18:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbhAIQ66 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 Jan 2021 11:58:58 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:10441 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbhAIQ66 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 9 Jan 2021 11:58:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610211366;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:From:
        Subject:Sender;
        bh=yZ1tzPuIdAyyljyt8M7WqNHeNP+VRFw89TM3Fu1kjjo=;
        b=ttaF6dbYWgicFS/tWaoJbo3bw2QQ5SjsUH4v8VTFXaTYOP6hJGK/2KLJj4ktUVsCFT
        tSPk7DpM+G/x3ekeqvsSUPMzPQ5qZOlrNIbKL/7k/i3K1Uz6gxE4GrtQ6BZW19fbn/bR
        P4YMP7Je1Rx8YhPW7grHCobiTBbdX2+oUOFoKyDTIrvoMRiXRUtAavcHAz7LktmxGmr0
        VNcnbIMNeGVY8CR/lN7GuyQL9Sv75cfkjb1FU4FgAosgQ9JeNi06nuuqIdf4p+Ua9Gok
        IU4KUSjzTmir7xkWcgiAx72JAbJUulH7uOHjCeyH9E8AJJ7N7bgk+994dLqE+na6Tfa7
        BvJg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAiw4rsMg=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id m056b3x09GtnJSK
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 9 Jan 2021 17:55:49 +0100 (CET)
Subject: Re: [PATCH] ARM: dts: omap36xx: Remove turbo mode for 1GHz variants
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20210109163916.1247431-1-aford173@gmail.com>
Date:   Sat, 9 Jan 2021 17:55:48 +0100
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>, aford@beaconembedded.com,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8B45575E-A50B-407C-8920-D2A7E295DBE9@goldelico.com>
References: <20210109163916.1247431-1-aford173@gmail.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,

> Am 09.01.2021 um 17:39 schrieb Adam Ford <aford173@gmail.com>:
>=20
> Previously, the 1GHz variants were marked as a turbo,
> because that variant has reduced thermal operating range.
>=20
> Now that the thermal throttling is in place, it should be
> safe to remove the turbo-mode from the 1GHz variants, because
> the CPU will automatically slow if the thermal limit is reached.

Subject and description may be misunderstood in a way that 1GHz
is now disabled.

Rather the 1GHz OPP is now permanently enabled and does no longer
need to be manuall enabled through something like
/sys/devices/system/cpu/cpufreq/boost.

>=20
> Signed-off-by: Adam Ford <aford173@gmail.com>
>=20
> diff --git a/arch/arm/boot/dts/logicpd-torpedo-som.dtsi =
b/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
> index 3a5228562b0d..3451f9be104e 100644
> --- a/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
> +++ b/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
> @@ -70,6 +70,7 @@ nand@0,0 {
> 		gpmc,device-width =3D <2>;
> 		#address-cells =3D <1>;
> 		#size-cells =3D <1>;
> +		status =3D "disabled";

this does not seem to match the description?

> 	};
> };
>=20
> --=20
> 2.25.1
>=20

BR,
Nikolaus

