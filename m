Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE12F7169C7
	for <lists+linux-omap@lfdr.de>; Tue, 30 May 2023 18:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232366AbjE3Qgb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 May 2023 12:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232386AbjE3Qga (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 May 2023 12:36:30 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BFDB102;
        Tue, 30 May 2023 09:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1685464486; i=deller@gmx.de;
        bh=pOnsu0UXhUHtGMUl6LOAOO/2VX+PoRE/+1EqzwG2Cg4=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=B7fIKKrQB9UvoHgfyoiG1mlA8TRJsMMbvbIivpHjuhxZh2cGge7JwgxftMMNqDLWx
         jrDZPN8j85Lu/sheR3KNEHOC7EtpZ9+Qvh6rE6kQLAZwEmkjnq/XTWBMA1AALngeE8
         +z76w1ohrptQaoVMio+qIsBNJSJYEVycWkO8TOlMGvvn72x/HrMxrG21wxp2833+j6
         vZCk8Ei0v5Es/JRWWuXpStNfFw/HWInM7fuDYW1XFx6vuASvTzqGb9cPv814chcYJq
         xez0llu4RZA00pY55s8sQ4UFfuLp9bSMSEUgI6BZhtsewKH1+dwX3o68GNzISqI50n
         yoFE3NfsALPIQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.145.122]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MA7Ka-1pwrZ13OSQ-00BeAa; Tue, 30
 May 2023 18:34:46 +0200
Message-ID: <7eed2e10-05af-1ebc-1285-eb17b3113183@gmx.de>
Date:   Tue, 30 May 2023 18:34:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/51] video: fbdev: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>, Stephen Kitt <steve@sk2.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Tony Lindgren <tony@atomide.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Michal Simek <michal.simek@xilinx.com>,
        Wang Qing <wangqing@vivo.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Peter Jones <pjones@redhat.com>,
        Xuezhi Zhang <zhangxuezhi1@coolpad.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        Rob Herring <robh@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Alexander Shiyan <shc_work@mail.ru>,
        Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
        Xu Panda <xu.panda@zte.com.cn>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Kristoffer Ericson <kristoffer.ericson@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        kernel@pengutronix.de, Arnd Bergmann <arnd@arndb.de>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Yu Zhe <yuzhe@nfschina.com>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Zeng Heng <zengheng4@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Hyunwoo Kim <imv4bel@gmail.com>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Yihao Han <hanyihao@vivo.com>, Timur Tabi <timur@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        Dongliang Mu <dzm91@hust.edu.cn>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Shawn Guo <shawnguo@kernel.org>
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
 <ff758418-f1da-e297-1829-251b8a5b1ec3@gmx.de>
 <20230530140239.qevvxcuaqufv6hwj@pengutronix.de>
 <3010bce3-cc66-4ad6-50b1-7bc66bd532d4@gmx.de>
 <20230530162728.sexlrqhkoflvuu7m@pengutronix.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20230530162728.sexlrqhkoflvuu7m@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:E++EmP+ym2sEOCl+bnTWXEklw76bBN9S6rNejjTq73I4UK8y854
 Hc2XhIoXumxSTayvEn1bBCEKO2+p0L9Ol4z+GmyiVAIGiLPb0HPcXFigbWHv6+SrHvaNmBG
 UVjlaTve4Psci2F+HjfMDs1M70QYgUjPsi7w2Pjaatl1uJvkvXRSQmNyhhM3pRh/gWVVTS1
 KCEdyXPe213BtsJf6ujfw==
UI-OutboundReport: notjunk:1;M01:P0:CwI8Wmu5Jnc=;MyaDuNCNBCBC+oQPgzvrelDRKne
 YjWKextfx8T29KC+o2bk1QsCs83qmg/B/6ZbDgJUGkzM04fTFdddPxCXitvZiA1ycrX0rbcdJ
 h+xkcKqLqg+nOHxZQyUud8xXdtzYnDws294Lwm+/ZrrZIKhgcNJjm7WrPIWYSDxS4++AAUzHn
 DDT7Eixqzi8I+rdGeDidw38jU/6Ua/a5g8Kh1Or5VpwMe/fKggMfnRJDsGqFeTFnjE6RQ9beE
 bPgtuT2Tsct4RdCCmulIxH+ZFoXWURzSU08SvfnklfensZoCGfe9p4Y1Oa32o6BnAnie9QFja
 HRQayGKMf3mi0zNSayDJYX7YnW0Z+2tqj6tQ7gY7462MPKLi+T6YweLFfUGQJNTF0wyKu8XuE
 Xl4A6E4kMgKaoJR40xvZfZiruX41xZwYJylqVub9MVyX0vn5AuXu2fVT8f5L7Zlu0bgDwhhWj
 KRRXYeY1eaNIkgdSub94z3lc8zQuF+WVPkkgpxitzVhIBcUCon1bQJJmuWTpU5riHi6ZFmWL1
 J+JDXKp/26Cfn7MmrtATuw9bJOYnIDHPFIHu1dinKsF9dWQGjPgU5xgamYh5AJi8dhJsKzH/P
 b5WXezheLM95KesLT2hqwmLT4MVkaE6aA/3jZO0gWhkiON4I8HdMOtohEjhuXFFd/FJ2D1+KH
 q8SppRt/+MsRRnruYORQl/fkSRwLWcTKR0pGhX/7SHsqT+qFZpE4S3xC62sybQnWcSqM1DL6f
 VcvPGvLCud59BDZrB1NMyY9Bb06C48kMLbTgKVMbejkBkAH+hefKlpLLXfT6gb9AwS2Kn4Spj
 Kia0fSrp5uM88/LLzpXY6FhvCtHsNJB74bKD1nDHiWUUfTl7iosxczDOWfFFEsZTqOaUdHTdm
 deVuyEEy88YN9KxWOjiCu3k/gugAcOOM6umlCIvdriQeC3TqS1tpKgilFCnA0zLjm5euEYVbz
 DBsze8AZDXwAeojJ7w92yanCCpI=
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 5/30/23 18:27, Uwe Kleine-K=C3=B6nig wrote:
> Hello Helge,
>
> On Tue, May 30, 2023 at 06:12:09PM +0200, Helge Deller wrote:
>> Btw... I cleaned up some minor whitespace issues in patch 3 (au1100fb).
>
> We both did some different cleanup, on top of your
> 87be5a5d9a5c5b00505181eedbee62134f07d11d we could further cleanup doing
>
> diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100=
fb.c
> index fb38557a9b63..648d6cac86e8 100644
> --- a/drivers/video/fbdev/au1100fb.c
> +++ b/drivers/video/fbdev/au1100fb.c
> @@ -590,7 +590,7 @@ static struct platform_driver au1100fb_driver =3D {
>   	.probe		=3D au1100fb_drv_probe,
>   	.remove_new	=3D au1100fb_drv_remove,
>   	.suspend	=3D au1100fb_drv_suspend,
> -        .resume		=3D au1100fb_drv_resume,
> +	.resume		=3D au1100fb_drv_resume,
>   };
>   module_platform_driver(au1100fb_driver);
>
> Feel free to squash this into 87be5a5d9a5c5b00505181eedbee62134f07d11d.
> If you want to apply it separately, either tell me to post a proper
> patch, or apply it under your name with my Suggested-by -- whatever
> suits you best.

I've squashed it into your patch.

Thanks!
Helge

