Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2258B1CF655
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 16:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729229AbgELOBp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 10:01:45 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37718 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbgELOBo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 May 2020 10:01:44 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04CE1Mk2043470;
        Tue, 12 May 2020 09:01:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589292082;
        bh=OR75gZnwlt6fdZF5hDS19wyJydL4WevuZucaJhccRRA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=wQmZMWw3QUNf5p89vL84saTSjkWOmuRgAp9tMeHY8E5Pw3ADFjlCl++5v/hzNKC+/
         VoIrpH6eQgBYrVsh3ZmVNQVm7FyEdtD39I8FMH8XFLKPyRJgHS+Xjkz5bs6Ntu1Zk2
         tcUT2aIzMgv04fukjIVfGM8R4X+AqbVerGOVlDsw=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04CE1MG7083187
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 May 2020 09:01:22 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 12
 May 2020 09:01:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 12 May 2020 09:01:22 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04CE1Jxb032373;
        Tue, 12 May 2020 09:01:20 -0500
Subject: Re: [PATCH] ASoC: ti: omap-mcbsp: Fix an error handling path in
 'asoc_mcbsp_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        <jarkko.nikula@bitmer.com>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <linux-omap@vger.kernel.org>
CC:     <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20200512134325.252073-1-christophe.jaillet@wanadoo.fr>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <5f1b0172-279c-9368-838e-6ef0e2d67b15@ti.com>
Date:   Tue, 12 May 2020 17:01:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200512134325.252073-1-christophe.jaillet@wanadoo.fr>
Content-Type: multipart/mixed;
        boundary="------------BC4735E1360B906FD979E055"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--------------BC4735E1360B906FD979E055
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable



On 12/05/2020 16.43, Christophe JAILLET wrote:
> If an error occurs after the call to 'omap_mcbsp_init()', the reference=
 to
> 'mcbsp->fclk' must be decremented, as already done in the remove functi=
on.
>=20
> This can be achieved easily by using the devm_ variant of 'clk_get()'
> when the reference is taken in 'omap_mcbsp_init()'
>=20
> This fixes the leak in the probe and has the side effect to simplify bo=
th
> the error handling path of 'omap_mcbsp_init()' and the remove function.=


Acked-by: Peter Ujfalusi <peter.ujflausi@ti.com>

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> I've not been able to identify the when the issue has been introduced, =
so
> no Fixes: tag.

I think this is there for a long-long time. It is a theoretical bug, in
practice it never happen (at least never faced with it over the years).

Thanks for the fix!

- P=C3=A9ter

> ---
>  sound/soc/ti/omap-mcbsp.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> index 0348963f4df7..6c83b9888467 100644
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -686,7 +686,7 @@ static int omap_mcbsp_init(struct platform_device *=
pdev)
>  	mcbsp->dma_data[1].addr =3D omap_mcbsp_dma_reg_params(mcbsp,
>  						SNDRV_PCM_STREAM_CAPTURE);
> =20
> -	mcbsp->fclk =3D clk_get(&pdev->dev, "fck");
> +	mcbsp->fclk =3D devm_clk_get(&pdev->dev, "fck");
>  	if (IS_ERR(mcbsp->fclk)) {
>  		ret =3D PTR_ERR(mcbsp->fclk);
>  		dev_err(mcbsp->dev, "unable to get fck: %d\n", ret);
> @@ -711,7 +711,7 @@ static int omap_mcbsp_init(struct platform_device *=
pdev)
>  		if (ret) {
>  			dev_err(mcbsp->dev,
>  				"Unable to create additional controls\n");
> -			goto err_thres;
> +			return ret;
>  		}
>  	}
> =20
> @@ -724,8 +724,6 @@ static int omap_mcbsp_init(struct platform_device *=
pdev)
>  err_st:
>  	if (mcbsp->pdata->buffer_size)
>  		sysfs_remove_group(&mcbsp->dev->kobj, &additional_attr_group);
> -err_thres:
> -	clk_put(mcbsp->fclk);
>  	return ret;
>  }
> =20
> @@ -1442,8 +1440,6 @@ static int asoc_mcbsp_remove(struct platform_devi=
ce *pdev)
> =20
>  	omap_mcbsp_st_cleanup(pdev);
> =20
> -	clk_put(mcbsp->fclk);
> -
>  	return 0;
>  }
> =20
>=20

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

--------------BC4735E1360B906FD979E055
Content-Type: application/pgp-keys; name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBFki4nsBCAD3BM+Ogt951JlaDloruEjoZk/Z+/37CjP0fY2mqLhBOzkpx95u
X1Fquf0KfVk+ZzCd25XGOZEtpZNlXfbxRr2iRWPS5RW2FeLYGvg2TTJCpSr+ugKu
OOec6KECCUotGbGhpYwBrbarJNEwDcAzPK7UJYa1rhWOmkpZJ1hXF1hUghB84q35
8DmN4sGLcsIbVdRFZ1tWFh4vGBFV9LsoDZIrnnANb6/XMX78s+tr3RG3GZBaFPl8
jO5IIv0UIGNUKaYlNVFYthjGCzOqtstHchWuK9eQkR7m1+Vc+ezh1qK0VJydIcjn
OtoMZZL7RAz13LB9vmcJjbQPnI7dJojz/M7zABEBAAG0JlBldGVyIFVqZmFsdXNp
IDxwZXRlci51amZhbHVzaUB0aS5jb20+iQFOBBMBCAA4FiEE+dBcpRFvJjZw+uta
LCayis85LN4FAlki4nsCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQLCay
is85LN4QjggAzxxxXqiWpA3vuj9yrlGLft3BeGKWqF8+RzdeRvshtNdpGeIFf+r5
AJVR71R1w89Qeb4DGXus7qsKiafdFGG7yxbuhw8a5wUm+ZncBXA+ETn3OyVtl8g8
r/ZcPX420jClBNTVuL0sSnyqDFDrt5f+uAFOIwsnHdpns174Zu9QhgYxdvdZ+jMh
Psb745O9EVeNvdfUIRdrVjb4IhJKNIzkb0Tulsz5xeCJReUYpxZU1jzEq3YZqIou
+fi+oS4wlJuSoxKKTmIXtSeEy/weStF1XHMo6vLYqzaK4FyIuclqeuYUYSVy2425
7TMXugaI+O85AEI6KW8MCcu1NucSfAWUabkBDQRZIuJ7AQgAypKq8iIugpHxWA2c
Ck6MQdPBT6cOEVK0tjeHaHAVOUPiw9Pq+ssMifdIkDdqXNZ3RLH/X2svYvd8c81C
egqshfB8nkJ5EKmQc9d7s0EwnYT8OwsoVb3c2WXnsdcKEyu2nHgyeJEUpPpMPyLc
+PWhoREifttab4sOPktepdnUbvrDK/gkjHmiG6+L2owSn637N+Apo3/eQuDajfEu
kybxK19ReRcp6dbqWSBGSeNB32c/zv1ka37bTMNVUY39Rl+/8lA/utLfrMeACHRO
FGO1BexMASKUdmlB0v9n4BaJFGrAJYAFJBNHLCDemqkU7gjaiimuHSjwuP0Wk7Ct
KQJfVQARAQABiQE2BBgBCAAgFiEE+dBcpRFvJjZw+utaLCayis85LN4FAlki4nsC
GwwACgkQLCayis85LN7kCwgAoy9r3ZQfJNOXO1q/YQfpEELHn0p8LpwliSDUS1xL
sswyxtZS8LlW8PjlTXuBLu38Vfr0vGav7oyV7TkhnKT3oBOLXanyZqwgyZSKNEGB
PB4v3Fo7YTzpfSofiwuz03uyfjTxiMGjonxSb+YxM7HBHfzjrOKKlg02fK+lWNZo
m5lXugeWD7U6JJguNdYfr+U4zYIblelUImcIE+wnR0oLzUEVDIWSpVrl/OqS3Rzo
mw8wBsHksTHrbgUnKL0SCzYc90BTeKbyjEBnVDr+dlfbxRxkB8h9RMPMdjodvXzS
Gfsa9V/k4XAsh7iX9EUVBbnmjA61ySxU/w98h96jMuteTg=3D=3D
=3DeQmw
-----END PGP PUBLIC KEY BLOCK-----

--------------BC4735E1360B906FD979E055--
