Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF516734E7
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jan 2023 10:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjASJ64 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Jan 2023 04:58:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjASJ6y (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Jan 2023 04:58:54 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7426053E41
        for <linux-omap@vger.kernel.org>; Thu, 19 Jan 2023 01:58:53 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 98D8380F1;
        Thu, 19 Jan 2023 09:58:52 +0000 (UTC)
Date:   Thu, 19 Jan 2023 11:58:51 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        linux-omap@vger.kernel.org,
        Maciej Falkowski <maciej.falkowski9@gmail.com>
Subject: Re: [PATCH v2] ARM: OMAP1: Move h2 LEDs to GPIO lookup table
Message-ID: <Y8kUW8+vz62CXFsj@atomide.com>
References: <20230111132403.134617-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111132403.134617-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Linus Walleij <linus.walleij@linaro.org> [230111 15:24]:
> This converts the the H2 GPIO LEDs to use a machine lookup
> table.
> 
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Maciej Falkowski <maciej.falkowski9@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Rebased on v6.2-rc1
> - I suppose Tony picks this up?

OK thanks, applying into omap-for-v6.3/omap1 branch.

Tony
