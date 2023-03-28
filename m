Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0628B6CB63E
	for <lists+linux-omap@lfdr.de>; Tue, 28 Mar 2023 07:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjC1FqT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Mar 2023 01:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjC1FqS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Mar 2023 01:46:18 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C5F169C
        for <linux-omap@vger.kernel.org>; Mon, 27 Mar 2023 22:46:17 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 236008108;
        Tue, 28 Mar 2023 05:46:17 +0000 (UTC)
Date:   Tue, 28 Mar 2023 08:46:15 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Kenneth Lee <klee33@uw.edu>
Cc:     bcousson@baylibre.com, paul@pwsan.com, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: OMAP2+: hwmod: Use kzalloc for allocating only one
 element
Message-ID: <20230328054615.GM7501@atomide.com>
References: <20220809072050.1733996-1-klee33@uw.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809072050.1733996-1-klee33@uw.edu>
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Kenneth Lee <klee33@uw.edu> [220809 10:14]:
> Use kzalloc(...) rather than kcalloc(1, ...) because the number of
> elements we are specifying in this case is 1, so kzalloc would
> accomplish the same thing and we can simplify.

Thanks applying into omap-for-v6.4/cleanup.

Tony
