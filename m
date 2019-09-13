Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28152B1880
	for <lists+linux-omap@lfdr.de>; Fri, 13 Sep 2019 08:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbfIMG4Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 02:56:16 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:34849 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727380AbfIMG4Q (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Sep 2019 02:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568357773;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=C+ukX80c7uifUayDRWycHsjOFJ7Cgc66BbzfwWvYp5E=;
        b=n9JgACGrreaaj0GSEtWLRwLiOgOFVxq4wzzBG0u7tVA2F9ARBnfhfIZZV8XUNoaoAC
        nPyR8BVUlTNihF/8yc4QmXP+AOH6vJfPBNlSUALewgCQ7EVpR/xzZ27ctSLDtN7kn2FK
        2juf/84HHOfzpuJZgByeJG2BI2/UzFs2R22A+ZJ9B/PCTK+qdCuQC7fFPaosD5tVUaj3
        gS1e93rqXHGHM69t5TzTUQdXeglkdjgLlVFFgBoRttMlqrPAz7UbJ6txAohZFP1Ud7Ky
        envcH6tHO7USZFJYM/yvMhKTTDEayWNEd8KTuQLe1IKvd3QDGbakjHbhSiYm/boE9VoF
        qBlQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSVXA4OAWU="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v8D6tvFHh
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 13 Sep 2019 08:55:57 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [RFC] ARM: dts: omap36xx: Enable thermal throttling
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190912183037.18449-1-aford173@gmail.com>
Date:   Fri, 13 Sep 2019 08:55:57 +0200
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>, neolynx@gmail.com,
        letux-kernel@openphoenux.org, linux-kernel@vger.kernel.org,
        andreas@kemnade.info, nm@ti.com, adam.ford@logicpd.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <D4F7E03C-1880-45AC-8F7C-6C8A336E2A01@goldelico.com>
References: <20190912183037.18449-1-aford173@gmail.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,

> Am 12.09.2019 um 20:30 schrieb Adam Ford <aford173@gmail.com>:
>=20
> The thermal sensor in the omap3 family isn't accurate, but it's
> better than nothing.  The various OPP's enabled for the omap3630
> support up to OPP1G, however the datasheet for the DM3730 states
> that OPP130 and OPP1G are not available above TJ of 90C.

We may have to add similar things for omap34xx as well. See
data sheet 3.3 Recommended Operating Conditions

But when reading them they do not limit temperature but
number of operation hours of each OPP depending on temperature...
That is clearly beyond what a kernel can do (we would have to
have access to some NVRAM in the kernel counting hours).

>=20
> This patch configures the thermal throttling to limit the
> operating points of the omap3630 to Only OPP50 and OPP100 if

s/Only/only/

> the thermal sensor reads a value above 90C.
>=20
> Signed-off-by: Adam Ford <aford173@gmail.com>
>=20
> diff --git a/arch/arm/boot/dts/omap36xx.dtsi =
b/arch/arm/boot/dts/omap36xx.dtsi
> index 4bb4f534afe2..58b9d347019f 100644
> --- a/arch/arm/boot/dts/omap36xx.dtsi
> +++ b/arch/arm/boot/dts/omap36xx.dtsi
> @@ -25,6 +25,7 @@
>=20
> 			vbb-supply =3D <&abb_mpu_iva>;
> 			clock-latency =3D <300000>; /* =46rom =
omap-cpufreq driver */
> +			#cooling-cells =3D <2>;
> 		};
> 	};
>=20
> @@ -195,6 +196,31 @@
> 	};
> };
>=20
> +&cpu_thermal {
> +	cpu_trips: trips {

Yes, that is comparable to what I have seen in omap5 DT where I know
that thermal throttling works.

> +		/* OPP130 and OPP1G are not available above TJ of 90C. =
*/
> +		cpu_alert0: cpu_alert {
> +			temperature =3D <90000>; /* millicelsius */
> +			hysteresis =3D <2000>; /* millicelsius */
> +			type =3D "passive";
> +		};
> +
> +		cpu_crit: cpu_crit {
> +			temperature =3D <125000>; /* millicelsius */

Shouldn't this be 105=C2=B0C for all omap3 chips (industrial temperature =
range)?

> +			hysteresis =3D <2000>; /* millicelsius */
> +			type =3D "critical";
> +		};
> +	};
> +
> +	cpu_cooling_maps: cooling-maps {
> +		map0 {
> +			trip =3D <&cpu_alert0>;
> +			/* Only allow OPP50 and OPP100 */
> +			cooling-device =3D <&cpu 0 1>;

omap4-cpu-thermal.dtsi uses THERMAL_NO_LIMIT constants but I do not
understand their meaning (and how it relates to the opp list).

> +		};
> +	};

Seems to make sense when comparing to omap4-cpu-thermal.dtsi...

Maybe we can add the trip points to omap3-cpu-thermal.dtsi
because they seem to be the same for all omap3 variants and
just have a SoC variant specific cooling map for omap36xx.dtsi.

> +};
> +
> /* OMAP3630 needs dss_96m_fck for VENC */
> &venc {
> 	clocks =3D <&dss_tv_fck>, <&dss_96m_fck>;
> --=20
> 2.17.1
>=20

The question is how we can test that. Heating up the omap36xx to 90=C2=B0C=

or even 105=C2=B0C isn't that easy like with omap5...

Maybe we can modify the millicelsius values for testing purposes to
something in reachable range, e.g. 60=C2=B0C and 70=C2=B0C and watch =
what happens?

BR,
Nikolaus



