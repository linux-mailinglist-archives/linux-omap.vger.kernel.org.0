Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5B3E4720BE
	for <lists+linux-omap@lfdr.de>; Mon, 13 Dec 2021 06:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhLMFtf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Dec 2021 00:49:35 -0500
Received: from muru.com ([72.249.23.125]:37868 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229502AbhLMFtf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 13 Dec 2021 00:49:35 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 638B6809F;
        Mon, 13 Dec 2021 05:50:16 +0000 (UTC)
Date:   Mon, 13 Dec 2021 07:49:32 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: Remove unsupported properties for STMPE MFD
Message-ID: <Ybbe7DOnlgIGKMoB@atomide.com>
References: <20211209173009.618162-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209173009.618162-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Thierry Reding <thierry.reding@gmail.com> [211209 17:30]:
> From: Thierry Reding <treding@nvidia.com>
> 
> Some users of the STMPE MFD bindings use unsupported properties such as
> "id", "blocks" and "irq-trigger". These look like they may have been
> under discussion at some point but never made it into the bindings that
> were accepted upstream.
> 
> Remove these unknown properties from the device trees to avoid errors
> during validation against the DT schema.

Acked-by: Tony Lindgren <tony@atomide.com>
