Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C26177BC57F
	for <lists+linux-omap@lfdr.de>; Sat,  7 Oct 2023 09:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343670AbjJGHVK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 7 Oct 2023 03:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343636AbjJGHVJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 7 Oct 2023 03:21:09 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 394BBBD;
        Sat,  7 Oct 2023 00:21:08 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A0277809E;
        Sat,  7 Oct 2023 07:21:07 +0000 (UTC)
Date:   Sat, 7 Oct 2023 10:21:06 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Tero Kristo <t-kristo@ti.com>, Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: ti: fix double free in of_ti_divider_clk_setup()
Message-ID: <20231007072106.GV34982@atomide.com>
References: <6d36eeec-6c8a-4f11-a579-aa3cd7c38749@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d36eeec-6c8a-4f11-a579-aa3cd7c38749@moroto.mountain>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Dan Carpenter <dan.carpenter@linaro.org> [231002 10:04]:
> The "div" pointer is freed in _register_divider() and again in
> of_ti_divider_clk_setup().  Delete the free in _register_divider()

Reviewed-by: Tony Lindgren <tony@atomide.com>
