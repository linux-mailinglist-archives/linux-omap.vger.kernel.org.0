Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8382E4A7F96
	for <lists+linux-omap@lfdr.de>; Thu,  3 Feb 2022 08:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348990AbiBCHFt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Feb 2022 02:05:49 -0500
Received: from muru.com ([72.249.23.125]:45732 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237239AbiBCHFt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Feb 2022 02:05:49 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5D4498150;
        Thu,  3 Feb 2022 07:05:34 +0000 (UTC)
Date:   Thu, 3 Feb 2022 09:05:47 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH 07/12] gpio: omap: Move PM device over to irq domain
Message-ID: <Yft+y2iWTpuq8nXF@atomide.com>
References: <20220201120310.878267-1-maz@kernel.org>
 <20220201120310.878267-8-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220201120310.878267-8-maz@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Marc Zyngier <maz@kernel.org> [220201 12:03]:
> Move the reference to the device over to the irq domain.

PM still work for me:

Tested-by: Tony Lindgren <tony@atomide.com>
