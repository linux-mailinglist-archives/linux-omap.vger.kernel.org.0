Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF8A27168FC
	for <lists+linux-omap@lfdr.de>; Tue, 30 May 2023 18:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233405AbjE3QPU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 May 2023 12:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233549AbjE3QPR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 May 2023 12:15:17 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7BB1BC;
        Tue, 30 May 2023 09:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1685463140; i=deller@gmx.de;
        bh=rF0T2SlfmaNOFE5TtSeATbyrpJF607QsdHymKDcZe6w=;
        h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
        b=Ofr1y6INZLK2Lq55e/CkySJxvH7vwZAPKdvq4xk2Vx5+4YWoAhB+YTaVH4trzwxPP
         vcumSSEASDINXACtNCS2oQ3dLXOw4c2UMlYv24HrKUWgUbxHv8aBoJTTG790nomccC
         4S3vsdpRVJPK8Sh5Kc+bVjtP12LypiN8f0MYjYAwdvgsqaK5J4OhQ5I1f3YtoaHoWP
         ZSSlUB0xc/314WQ2qoJrJRJnYvvHBm8l+C1bbz1zAiaF9nOVyVXLjD0rClb9eabEML
         Ohkv+sEbFWJUUG99l4FS4uJ4DfE5o6MYvsTMuEd5HBpKLeNl/zBie6AINla9ord6Rb
         KA7S1cnX0W8kA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.145.122]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLzBj-1pmmBh22cL-00Hvo6; Tue, 30
 May 2023 18:12:20 +0200
Message-ID: <3010bce3-cc66-4ad6-50b1-7bc66bd532d4@gmx.de>
Date:   Tue, 30 May 2023 18:12:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Yihao Han <hanyihao@vivo.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Alexander Shiyan <shc_work@mail.ru>,
        Dongliang Mu <dzm91@hust.edu.cn>,
        Peter Jones <pjones@redhat.com>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        Timur Tabi <timur@kernel.org>,
        Xuezhi Zhang <zhangxuezhi1@coolpad.com>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Stephen Kitt <steve@sk2.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Yu Zhe <yuzhe@nfschina.com>, Xu Panda <xu.panda@zte.com.cn>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        Hyunwoo Kim <imv4bel@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wang Qing <wangqing@vivo.com>,
        Kristoffer Ericson <kristoffer.ericson@gmail.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Zeng Heng <zengheng4@huawei.com>,
        Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
        linux-omap@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
 <ff758418-f1da-e297-1829-251b8a5b1ec3@gmx.de>
 <20230530140239.qevvxcuaqufv6hwj@pengutronix.de>
From:   Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 00/51] video: fbdev: Convert to platform remove callback
 returning void
In-Reply-To: <20230530140239.qevvxcuaqufv6hwj@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZvZTPkbNvOksiJGgd4YpFec+cdJOC5Jo0ZP9OE45DFbFKd82/fu
 SWHmWpeJd8pXruTGDp6oEutnPqDX94T9vh8mLYiYiRsB5jMmNmy3kx595OIdUBP6ZGVJvNU
 x2ryzwcpOABdT+2OGsVQ8R9291TuriLeCt7Gu5NnyHU9VteCo9hSeXB1I41u0pWP50TJXJJ
 Jq4IWEgWR0VhAYXKKpwGQ==
UI-OutboundReport: notjunk:1;M01:P0:m0U2H1UF0ds=;OMxT2hGQ08PswwOdvigdBNqadDh
 ZOItP1jUeQkEBiUHqKNF8cp8Ov8kCca5s8G0pYJVSOUGoANIrhqdxfzJVqumoXrZhlaup9rdD
 b9Ff15jdWFpK2w2mxxB4Mtt0H3c/q0h6qPgS8IjiyIKo5H7MTSTZreZ7vBWLYZT6RObylfQYm
 KhzsDbdHHlb1Rk3aI6Ol2WmLU2lsofI+OLXh1KZwB1k7P541W3aDolE6nWPtM+S4jAdKHuI64
 903PsIm5O4Ly/CBHaw1vAWtnxs7QAGuu7k/gTLbtAVnT0XGp3homd1KOi7yyr5XMQ8oRaNQnk
 vrouZaQVm4FpW/G9AMZlK38pXrbddXZorRjMVOKJaUuSFLNECFTJb6/HhujY2t4LnEXcWI+g9
 yc+8sEKL9NPfVKtRkeuwYGX3E4jybQUf7f5UQHhfIvdjE/yBOa2HVZ5QCjfQEV4lC68rNMMRT
 wGzMcu1e7+xtikoqcz/GImnx4T7gjPhpUKJJGXxbLH94jjm2Jvw3CddmTwlKU/ZkdBa5HVbFU
 XclhcPF4E67URgoO8JIu5yArpGWS29nxSvPM1DXdfko2mrflK2TmBjI+LP2JO4WQujgQpHeyd
 8AeNCJWfC0/fqxnZ4hNpfVb2xjqAtDXvE7+MzcnzVJmjBYcdBuVwVdWUi0bXqDfQ2UYbZVyEj
 wGsOdoZx4St/XiAcGQT0pmb+LteqLJmO54j10goLkCwrW5KfZzub/FwdpGGCEmR/ucMB3cS6/
 gFlwNvviVfuvZrt3BswRj55HXyfaDzR5soeSXlgo5o7wcJrKwq+XYdidTKNxfiC1+Ekv1b2/8
 06Wess1Yig8d9b7qqKxAcoTdK/MDFdfBOXSrBFWPBzsKFJN1Gy9wqgmz5gbp994LOUQ4g6ldJ
 NxhZ/gJdgkNxvGaopw4h0TaTKmNKHow1M3fBUEyZzAYrpZgviMG+0RQ+NKUQ4NPqvFHj2EMim
 OXxqPBc8OOEbZML5P8ecUwbFhQw=
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

Hi Uwe,

On 5/30/23 16:02, Uwe Kleine-K=C3=B6nig wrote:
> On Sun, Mar 19, 2023 at 07:04:54PM +0100, Helge Deller wrote:
>> On 3/19/23 00:53, Uwe Kleine-K=C3=B6nig wrote:
>>> this series adapts the platform drivers below drivers/video/fbdev to u=
se the
>>> .remove_new() callback. Compared to the traditional .remove() callback
>>> .remove_new() returns no value. This is a good thing because the drive=
r core
>>> doesn't (and cannot) cope for errors during remove. The only effect of=
 a
>>> non-zero return value in .remove() is that the driver core emits a war=
ning. The
>>> device is removed anyhow and an early return from .remove() usually yi=
elds a
>>> resource leak.
>>>
>>> By changing the remove callback to return void driver authors cannot
>>> reasonably assume any more that there is some kind of cleanup later.
>>>
>>> The first patch simplifies the remove callback of one driver to obviou=
sly
>>> always return zero. After that all drivers are converted trivially to
>>> .remove_new().
>>
>> Thanks for that patch series. It's a nice cleanup.
>> I've applied it to the fbdev "for-next" git tree for now to get some co=
mpile testing.
>> I hope that's ok for you.
>
> I found patches #7 up to #51 in next, but the first 6 patches are
> missing. I guess this wasn't' done on purpose?

Strange. I don't know why I didn't applied those.

Anyway, I've just added them now:

Applying: video: fbdev: au1100fb: Drop if with an always false condition
Applying: video: fbdev: arcfb: Convert to platform remove callback returni=
ng void
Applying: video: fbdev: au1100fb: Convert to platform remove callback retu=
rning void
Applying: video: fbdev: au1200fb: Convert to platform remove callback retu=
rning void
Applying: video: fbdev: broadsheetfb: Convert to platform remove callback =
returning void
Applying: video: fbdev: bw2: Convert to platform remove callback returning=
 void

Thanks!
Helge

Btw... I cleaned up some minor whitespace issues in patch 3 (au1100fb).
