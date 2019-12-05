Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7F9E113C1B
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2019 08:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbfLEHGZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Dec 2019 02:06:25 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:31324 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfLEHGZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Dec 2019 02:06:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1575529582;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=FsJZPo0fckXEPJFWV4L4hsFM0Ad6IWDsYKHf+3rwx4k=;
        b=f1fMeVxjOK/npFA8/UR+Ec6bvWOJbZ/fZBE8l1YBUOyNGyLMIBRW5MwS2SkRXB7n8A
        ui+cUEXlMmA3mZDEjpaHO+oO30EU9Zl78d6ou3lAvDuRvoPxRk5uyv9saSs4xzLC6xj4
        SrDhmo01Ovw4L2mE8RlVIOswFLCzKklPeMVkOT+dMA5DwJlw6HoHYRLa5g3+v4xy0oBa
        AJc83p6/T9ky0LmcdaYV1AxdoBfULdVlLeE14PoGM6f3ueVq5L2exj9r+BLuJzStVen+
        i6zdOKL95+c8Bp7ah26Si/p+whKPNb8u+EUBls1IRXeOuggNIQhF6K9I43sSzVKXnbOa
        wo8A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSVXA4P1+M="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.0.2 DYNA|AUTH)
        with ESMTPSA id 6067eavB576KDCd
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 5 Dec 2019 08:06:20 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 2/2] dt-bindings: display: Add obsolete note to "ti,tilcdc,panel" binding
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <eabe78184ea7125dcff50826a0ee12a892443017.1575481630.git.jsarha@ti.com>
Date:   Thu, 5 Dec 2019 08:06:18 +0100
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Tony Lindgren <tony@atomide.com>, sam@ravnborg.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, tomi.valkeinen@ti.com,
        laurent.pinchart@ideasonboard.com, peter.ujfalusi@ti.com,
        bparrot@ti.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <55DCFF0C-E03E-44DA-A3BE-C81AA4D6782E@goldelico.com>
References: <cover.1575481630.git.jsarha@ti.com> <eabe78184ea7125dcff50826a0ee12a892443017.1575481630.git.jsarha@ti.com>
To:     Jyri Sarha <jsarha@ti.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 04.12.2019 um 18:53 schrieb Jyri Sarha <jsarha@ti.com>:
>=20
> The "ti,tilcdc,panel" binding should not be used anymore, since tilcdc
> is fully capable of using generic drm panels like panel-simple and
> panel-common binding.

Is there an example how to convert?

As far as I can see all arch/arm/boot/dts/am335x-*.dts use =
"ti,tilcdc,panel"

arch/arm/boot/dts/am335x-evm.dts would IMHO be a good candidate.

> However, the obsolete binding is still widely
> used in many mainline supported platforms that I do not have access to
> and who knows how many custom platforms. So I am afraid we have to
> keep the old bundled tilcdc panel driver around.
>=20
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
> Documentation/devicetree/bindings/display/tilcdc/panel.txt | 6 ++++++
> 1 file changed, 6 insertions(+)
>=20
> diff --git =
a/Documentation/devicetree/bindings/display/tilcdc/panel.txt =
b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
> index 808216310ea2..54963f9173cc 100644
> --- a/Documentation/devicetree/bindings/display/tilcdc/panel.txt
> +++ b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
> @@ -1,5 +1,11 @@
> Device-Tree bindings for tilcdc DRM generic panel output driver
>=20
> +NOTE: This binding (and the related driver) is obsolete and should =
not
> +      be used anymore. Please refer to drm panel-common binding (and
> +      to a generic drm panel driver like panel-simple).
> +      =
Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +      (drivers/gpu/drm/panel/panel-simple.c)
> +
> Required properties:
>  - compatible: value should be "ti,tilcdc,panel".
>  - panel-info: configuration info to configure LCDC correctly for the =
panel
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. =
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

