Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B301355CCE2
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 15:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235044AbiF1GCL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jun 2022 02:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245017AbiF1GCJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jun 2022 02:02:09 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 427AC2CC81
        for <linux-omap@vger.kernel.org>; Mon, 27 Jun 2022 23:02:09 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C15C48106;
        Tue, 28 Jun 2022 05:56:56 +0000 (UTC)
Date:   Tue, 28 Jun 2022 09:02:07 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Liang He <windhl@126.com>
Cc:     p.zabel@pengutronix.de, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2] bus/ti-sys: Fix refcount leak bugs
Message-ID: <YrqZX+bwQYQNgZ6m@atomide.com>
References: <20220620145619.4074665-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620145619.4074665-1-windhl@126.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Liang He <windhl@126.com> [220620 17:51]:
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -751,6 +751,7 @@ static void sysc_init_stdout_path(struct sysc *ddata)
>  		goto err;
>  
>  	uart = of_get_property(np, "stdout-path", NULL);
> +	of_node_put(np);
>  	if (!uart)
>  		goto err;
>  

Looks like you missed another of_node_put() after of_find_node_by_path()
in sysc_init_stdout_path(). Please add it and repost.

Thanks,

Tony
