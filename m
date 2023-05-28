Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE01713944
	for <lists+linux-omap@lfdr.de>; Sun, 28 May 2023 13:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjE1Ljo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 28 May 2023 07:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjE1Ljn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 28 May 2023 07:39:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38DFBBC;
        Sun, 28 May 2023 04:39:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BA28F61297;
        Sun, 28 May 2023 11:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9394FC433EF;
        Sun, 28 May 2023 11:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1685273981;
        bh=WtlDtiO7o3IdZ94cLuiib04GpSzPp1zVh24DIBWiihI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bxk2glO+BbOKrHzNMwfkUFuzSaTG4YMyWFqTCZLGydhnv4g0zhk5JUuOq6DFw6fcb
         0B/S7xbbC0DAoklyfFwD4QkVmX5YabCfrYz8Xj8mBc1AHpLk4ka5bgWFsrvlPNxC69
         ZxbRYnpD6PJP9/20rpUWKoRJ9FTTVTeA2SwbjnnQ=
Date:   Sun, 28 May 2023 12:39:33 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Prashanth K <quic_prashk@quicinc.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Michal Simek <michal.simek@amd.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joel Stanley <joel@jms.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Lei YU <yulei.sh@bytedance.com>,
        Neal Liu <neal_liu@aspeedtech.com>,
        Henry Tian <tianxiaofeng@bytedance.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Al Cooper <alcooperx@gmail.com>, Li Yang <leoyang.li@nxp.com>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Paolo Abeni <pabeni@redhat.com>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        Kalle Valo <kvalo@kernel.org>, Kang Chen <void0red@gmail.com>,
        Shaomin Deng <dengshaomin@cdjrlc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Richard Leitner <richard.leitner@linux.dev>,
        Colin Ian King <colin.i.king@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Zheng Wang <zyytlz.wz@163.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Rob Herring <robh@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Haotien Hsu <haotienh@nvidia.com>, Jim Lin <jilin@nvidia.com>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Sing-Han Chen <singhanc@nvidia.com>,
        Piyush Mehta <piyush.mehta@amd.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Darren Stevens <darren@stevens-zone.net>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Olav Kongas <ok@artecdesign.ee>,
        Artur Bujdoso <artur.bujdoso@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
        Jean Delvare <jdelvare@suse.de>,
        Dongliang Mu <mudongliangabcd@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Dan Carpenter <error27@gmail.com>,
        Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org,
        kernel@pengutronix.de, Roger Quadros <rogerq@kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed@lists.ozlabs.org,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        openbmc@lists.ozlabs.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org, Hongren Zheng <i@zenithal.me>
Subject: Re: [PATCH 00/97] usb: Convert to platform remove callback returning
 void
Message-ID: <2023052838-sincerity-dwindle-3658@gregkh>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <2023052848-patronage-zen-de4b@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2023052848-patronage-zen-de4b@gregkh>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, May 28, 2023 at 12:37:17PM +0100, Greg Kroah-Hartman wrote:
> On Thu, May 18, 2023 at 01:01:02AM +0200, Uwe Kleine-König wrote:
> > Hello,
> > 
> > this series convers the drivers below drivers/usb to the .remove_new()
> > callback of struct platform_driver(). The motivation is to make the
> > remove callback less prone for errors and wrong assumptions. See commit
> > 5c5a7680e67b ("platform: Provide a remove callback that returns no
> > value") for a more detailed rationale.
> > 
> > All drivers converted here already returned zero unconditionally in their
> > .remove() callback, so converting them to .remove_new() is trivial.
> 
> All but 2 patches applied, as one was for a driver that wasn't in the
> tree anymore, and the dwc2 patch didn't apply at all.

Oops, the xhci patches broke the build so I dropped them too.  Please
regenerate the series against the next linux-next that has these in
them and resend the remaining bits.

thanks,

greg k-h
