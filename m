Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27165709919
	for <lists+linux-omap@lfdr.de>; Fri, 19 May 2023 16:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbjESONB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 19 May 2023 10:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbjESONB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 19 May 2023 10:13:01 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9E0A3;
        Fri, 19 May 2023 07:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1684505573; i=deller@gmx.de;
        bh=tbCcr/2mh99Kp/T8oPTjqL/r2ONKQOr37+TIk6y2YvU=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=QU3rSZnyziskHwpFiMvdLKp5YBwf+mDuFOKF2b9yKtQDrqCd9HdARJlKLsX6b1FpT
         ufahe5XBrB5bF8QWMY8TT34Aq4UlAFZlU8Q5FrOVNudcCl4/5Xk/xExoGLvOq8XwDa
         mduTZFYQTi2FnR/tdfkdEfQw765C2p28Q0oZ0mr+uXTJxFS8C1f1+GttT+Xvxf4/sl
         GsbjHMAJzlYbwch+oKVhadqd48ZdfcCd2b+7Mbi7RXQvWr4t9KaZevR7rJEagN9rx4
         X90LAg0G1Z6q+U2ninmOijB1kSMv2MTLnPFqHY+vnpwDWbPUTwEVes2zarxgkzx799
         jAm6hyZQNAdtw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.152.232]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtOGU-1qI6Qt1MQo-00urQa; Fri, 19
 May 2023 16:12:53 +0200
Message-ID: <3f3878f0-70c6-1f87-2257-30dfce8411e6@gmx.de>
Date:   Fri, 19 May 2023 16:12:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] fbdev: omapfb: panel-tpo-td043mtea1: fix error code in
 probe()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Cai Huoqing <cai.huoqing@linux.dev>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <6f80089a-9223-4434-8da1-c071dd9367b5@kili.mountain>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <6f80089a-9223-4434-8da1-c071dd9367b5@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SW9PeyO7xD6f74VQh7991XhZwZncZqqfMuIV/Dw7/bDivEfCyfj
 BcLXCaIVITjdqwhFGe5/OJ4Sn5849L2C8SJFeFbLhaX/t2J5rwDWOgdrQkfkPg8+qFiPsAs
 hJFlsh3/wK79LWiuBvplR6t/RO2bIhU1UiVxBcnP6OLivXHtw2mm4+KbBpJajU3JkIkmPcO
 b48qKRFnk/KmT1wguYUWA==
UI-OutboundReport: notjunk:1;M01:P0:Z7TPJaraKlQ=;ZC+NnIOEKEAP0RToH8ucaYAC7oP
 h2vRmVC49MXbQkTcgg1rl4zOZ5nn6eVWqo4mzWPaLAvnvllGneDqglToZVMqacotmzfFDpQ3v
 4TUAZveJk2NKiTwOsuoxgrE0szrb5ZOGx1KoN4GXA0B3JxS15MlLUUs3OBJHl1e/Rz6s1Qpcf
 kkKtjggT9zZyzCwXxpQcmsOiirKZPgjAadJ9mJTQI4PvIVgLuxqIO+c7BVEDMtISy0B/+YKJX
 Qzt71JrzdiVb5oc/UNRLi19b1wf2FFTZDiNscQpVjmhm+yfK7OJs+nqNHmeTf8PxPWKjfsyw/
 lVT1b9mDlF5NN6ZcOdx+6FCsOxNl0HfZYZi7hPPPubkJtK9Sy2dc5jGGxBgUMVLu4tEiPUGMu
 8mlHJsju3yyV828KEtdvJRlfZ4oxMLoj7U3v+JW1N2qKDPB6KmGWIY6zXFTLWl8XskMoMZQi2
 mpNrwujxFdA0ASzMnF7tdQEfjtnsIY9bt7aPlx9lX9ChLbhTefhL3FRou38bcZ6HPttFEUVk6
 Zsby1PQmCpDnHOsXAvwJzy/VYeHh6p5721LDXYVLSsbNO0vBcGjKTz/EiNhbMbf4MW/TKPhXH
 9Jna7TGF12GzZOdJDNHQa506nJ33FSXEjuqKrahho/eGp6v2Oqpo/466rwy4qlTMsA+ojkNdI
 H4N7GW3+7irmpv5NEgiPKm7VTGhiBY4Zp6F74HrWnFOg1L9hr4UanPeQecVgOdfY5gAgll3pc
 y6MMjMxLg5kMY48yekfbUdCaq/P89MzPYzSskhHoXLwdANtsTEeUNBKL/DtaNolnc/IU7PMOg
 9bOi7SG5Gzv1VD4Tw3Wu5ZO2WxU2hKe97KX0qVoIBMTwLleRbbpOjb7cq3bFOl0kNBaVos3yj
 ATDYcRtVmJAY+q9xsyUAlvau0G0Puz7XFmXnH6gp6SJHMMx5ofTNjsFw0tlqyWmW5XdpxQfct
 rFUKrKVcEPUEMfkmmcDRcrHRac4=
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 5/15/23 12:32, Dan Carpenter wrote:
> This was using the wrong variable, "r", instead of "ddata->vcc_reg", so
> it returned success instead of a negative error code.
>
> Fixes: 0d3dbeb8142a ("video: fbdev: omapfb: panel-tpo-td043mtea1: Make u=
se of the helper function dev_err_probe()")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   .../video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c   | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

applied.

Thanks!
Helge

>
> diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mt=
ea1.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
> index 1eaa35c27835..477789cff8e0 100644
> --- a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
> +++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
> @@ -491,7 +491,8 @@ static int tpo_td043_probe(struct spi_device *spi)
>
>   	ddata->vcc_reg =3D devm_regulator_get(&spi->dev, "vcc");
>   	if (IS_ERR(ddata->vcc_reg)) {
> -		r =3D dev_err_probe(&spi->dev, r, "failed to get LCD VCC regulator\n"=
);
> +		r =3D dev_err_probe(&spi->dev, PTR_ERR(ddata->vcc_reg),
> +				  "failed to get LCD VCC regulator\n");
>   		goto err_regulator;
>   	}
>

