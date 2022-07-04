Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0634B564EA3
	for <lists+linux-omap@lfdr.de>; Mon,  4 Jul 2022 09:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233204AbiGDH0o (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Jul 2022 03:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233196AbiGDH0o (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Jul 2022 03:26:44 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 41AD365E7
        for <linux-omap@vger.kernel.org>; Mon,  4 Jul 2022 00:26:43 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3DBEF80C1;
        Mon,  4 Jul 2022 07:21:18 +0000 (UTC)
Date:   Mon, 4 Jul 2022 10:26:41 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Liang He <windhl@126.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: [PATCH v3] arm: mach-omap2: omap4-common: Fix refcount leak bug
Message-ID: <YsKWMdKPZzI06RXP@atomide.com>
References: <20220628112939.160737-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628112939.160737-1-windhl@126.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Liang He <windhl@126.com> [220628 14:24]:
> In omap4_sram_init(), of_find_compatible_node() will return a node
> pointer with refcount incremented. We should use of_node_put() when
> it is not used anymore.

Thanks applying into omap-for-v5.20/soc.

Tony
