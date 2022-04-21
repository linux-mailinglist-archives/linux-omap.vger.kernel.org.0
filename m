Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E65CE509F4B
	for <lists+linux-omap@lfdr.de>; Thu, 21 Apr 2022 14:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382993AbiDUMKc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Apr 2022 08:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351963AbiDUMKc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Apr 2022 08:10:32 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3DF3B1F63A
        for <linux-omap@vger.kernel.org>; Thu, 21 Apr 2022 05:07:43 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 26BCC8106;
        Thu, 21 Apr 2022 12:04:51 +0000 (UTC)
Date:   Thu, 21 Apr 2022 15:07:41 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] bus: ti-sysc: Drop commas after SoC match table sentinels
Message-ID: <YmFJDTeqRcwb5Ucu@atomide.com>
References: <602f74030dc746eaa9f82f115acc46e62c6be165.1646311501.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <602f74030dc746eaa9f82f115acc46e62c6be165.1646311501.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Geert Uytterhoeven <geert+renesas@glider.be> [220303 14:44]:
> It does not make sense to have a comma after a sentinel, as any new
> elements must be added before the sentinel.

Applying into omap-for-v5.19/ti-sysc thanks.

Tony
