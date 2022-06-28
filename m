Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9419A55D2F3
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 15:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343541AbiF1Gfw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jun 2022 02:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245637AbiF1Gff (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jun 2022 02:35:35 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2C19711A2B
        for <linux-omap@vger.kernel.org>; Mon, 27 Jun 2022 23:34:47 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 87B968106;
        Tue, 28 Jun 2022 06:29:34 +0000 (UTC)
Date:   Tue, 28 Jun 2022 09:34:45 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Liang He <windhl@126.com>
Cc:     p.zabel@pengutronix.de, linux-omap@vger.kernel.org
Subject: Re: Re:Re: [PATCH v2] bus/ti-sys: Fix refcount leak bugs
Message-ID: <YrqhBcq3exSgiJkC@atomide.com>
References: <20220620145619.4074665-1-windhl@126.com>
 <YrqZX+bwQYQNgZ6m@atomide.com>
 <462f1827.4050.181a8edfab0.Coremail.windhl@126.com>
 <72f5a5a8.42a3.181a8fb4c13.Coremail.windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72f5a5a8.42a3.181a8fb4c13.Coremail.windhl@126.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Liang He <windhl@126.com> [220628 06:19]:
> I have re-checked the sysc_init_stdout_path(), I think the second of_node_put 
> is not needed as the second 'np' will be escaped out into global 'stdout_path'.

Yup you're right, thanks for checking it.

Regards,

Tony
