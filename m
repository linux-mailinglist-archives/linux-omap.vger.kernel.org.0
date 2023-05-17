Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35BD570607A
	for <lists+linux-omap@lfdr.de>; Wed, 17 May 2023 08:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjEQGyM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 May 2023 02:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjEQGyL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 May 2023 02:54:11 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5F0B210C3
        for <linux-omap@vger.kernel.org>; Tue, 16 May 2023 23:54:10 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7AFFF8117;
        Wed, 17 May 2023 06:54:09 +0000 (UTC)
Date:   Wed, 17 May 2023 09:54:08 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     linux-omap@vger.kernel.org
Subject: Re: [bug report] bus: ti-sysc: Implement display subsystem reset
 quirk
Message-ID: <20230517065408.GR14287@atomide.com>
References: <a8ec8a68-9c2c-4076-bf47-09fccce7659f@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8ec8a68-9c2c-4076-bf47-09fccce7659f@kili.mountain>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Dan Carpenter <dan.carpenter@linaro.org> [230515 08:28]:
> Hello Tony Lindgren,
> 
> The patch 7324a7a0d5e2: "bus: ti-sysc: Implement display subsystem
> reset quirk" from Feb 24, 2020, leads to the following Smatch static
> checker warning:
> 
> 	drivers/bus/ti-sysc.c:1806 sysc_quirk_dispc()
> 	warn: masking a bool
> 
> drivers/bus/ti-sysc.c
>     1756 static u32 sysc_quirk_dispc(struct sysc *ddata, int dispc_offset,
>     1757                             bool disable)
>     1758 {
...
>     1794         /* DISP_CONTROL */
>     1795         val = sysc_read(ddata, dispc_offset + 0x40);
>     1796         lcd_en = val & lcd_en_mask;
>     1797         digit_en = val & digit_en_mask;
>     1798         if (lcd_en)
>     1799                 irq_mask |= BIT(0);                        /* FRAMEDONE */
>     1800         if (digit_en) {
>     1801                 if (framedonetv_irq)
>     1802                         irq_mask |= BIT(24);                /* FRAMEDONETV */
>     1803                 else
>     1804                         irq_mask |= BIT(2) | BIT(3);        /* EVSYNC bits */
>     1805         }
> --> 1806         if (disable & (lcd_en | digit_en))
> 
> digit_en is BIT(1) so this mask doesn't make sense.  Probably logical
> && and || were intended or && and |?

Thanks for the report, the idea is to reset before disable if lcd or
digit was enabled, so yeah should be if (disable && (lcd_en || digit_en))
since they're bool and not masks. I'll check and add a comment too.

Regards,

Tony
