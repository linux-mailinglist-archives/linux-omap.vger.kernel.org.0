Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 118646BCAE6
	for <lists+linux-omap@lfdr.de>; Thu, 16 Mar 2023 10:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbjCPJcQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Mar 2023 05:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbjCPJcO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Mar 2023 05:32:14 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49F4B370A;
        Thu, 16 Mar 2023 02:32:12 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 02F89219ED;
        Thu, 16 Mar 2023 09:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1678959131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LgQ6KC2ybaQuhcxvNbj5yWV84Hdg07Eok3qBPbbxY94=;
        b=hSKEhyQb/6Qjn+ILebTCLmhg2e9A8CfNry1H0RTT8RjbcX0ewBMRxjmDEGJwKXajwe5mAZ
        lf5+kWSjWH3ALiTHhvLMzHP1U3K6ssM3drv98CuVfHI8RbC/TZ34ZdD7AfpSs1PrwdoY5A
        pI0L7xCe/IZAfteZaaDtgdTGWm9XBqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1678959131;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LgQ6KC2ybaQuhcxvNbj5yWV84Hdg07Eok3qBPbbxY94=;
        b=0yC+ZFrSFabuSowZtdH2oq1j4t0E9INETd9hrlrihhJEg9KK7ZdJaPl82UJ4mDZM/+qCvP
        EibyFzdcMAa1+2Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DE806133E0;
        Thu, 16 Mar 2023 09:32:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 9o+MNRjiEmRkRAAAMHmgww
        (envelope-from <tiwai@suse.de>); Thu, 16 Mar 2023 09:32:08 +0000
Date:   Thu, 16 Mar 2023 10:32:08 +0100
Message-ID: <87ttylhwiv.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mohan Kumar <mkumard@nvidia.com>,
        Geoff Levand <geoff@infradead.org>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        syed saba kareem <syed.sabakareem@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Meng Tang <tangmeng@uniontech.com>,
        Martin =?ISO-8859-2?Q?Povi=B9er?= <povik+lin@cutebit.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Peter Rosin <peda@axentia.se>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        James Schulman <james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Lucas Tanure <tanureal@opensource.cirrus.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Miaoqian Lin <linmq006@gmail.com>,
        Colin Ian King <colin.i.king@gmail.com>,
        Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Liang He <windhl@126.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Akihiko Odaki <akihiko.odaki@gmail.com>,
        Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?= 
        <amadeuszx.slawinski@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Moises Cardona <moisesmcardona@gmail.com>,
        Zhen Ni <nizhen@uniontech.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrey Turkin <andrey.turkin@gmail.com>,
        Muralidhar Reddy <muralidhar.reddy@intel.com>,
        Zhu Ning <zhuning0077@gmail.com>,
        Gongjun Song <gongjun.song@intel.com>,
        Shuming Fan <shumingf@realtek.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
        Hezi Shahmoon <hezi@marvell.com>,
        Neta Zur Hershkovits <neta@marvell.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Trevor Wu <trevor.wu@mediatek.com>,
        Dan Carpenter <error27@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linh Phung <linh.phung.jy@renesas.com>,
        Shang XiaoJing <shangxiaojing@huawei.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Li Chen <lchen@ambarella.com>,
        Ban Tao <fengzheng923@gmail.com>,
        Sameer Pujar <spujar@nvidia.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Li kunyu <kunyu@nfschina.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Max Filippov <jcmvbkbc@gmail.com>, alsa-devel@alsa-project.org,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        linux-tegra@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        patches@opensource.cirrus.com, Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
        linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 000/173] ALSA/ASoC: Convert to platform remove callback returning void
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 15 Mar 2023 16:04:52 +0100,
Uwe Kleine-König wrote:
> 
> Hello,
> 
> this series adapts the platform drivers below sound/ to use the .remove_new()
> callback. Compared to the traditional .remove() callback .remove_new() returns
> no value. This is a good thing because the driver core doesn't (and cannot)
> cope for errors during remove. The only effect of a non-zero return value in
> .remove() is that the driver core emits a warning. The device is removed anyhow
> and an early return from .remove() usually yields a resource leak.
> 
> By changing the remove callback to return void driver authors cannot
> reasonably assume any more that there is some kind of cleanup later.
> 
> The first two patches simplify a driver each to return zero unconditionally,
> and then all drivers are trivially converted to .remove_new().
> 
> There are nearly no interdependencies in this patch set---only 1 <- 11 and
> 2 <- 16. So even if some individual problems are found (I don't expect that),
> the other patches can (and from my POV should) still be applied.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (173):
(snip)

For the whole series,

Acked-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
