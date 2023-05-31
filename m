Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0847175FB
	for <lists+linux-omap@lfdr.de>; Wed, 31 May 2023 07:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231963AbjEaFFC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 31 May 2023 01:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbjEaFFB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 31 May 2023 01:05:01 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 08356EC;
        Tue, 30 May 2023 22:05:00 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 546678164;
        Wed, 31 May 2023 05:04:59 +0000 (UTC)
Date:   Wed, 31 May 2023 08:04:58 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Bo Liu <liubo03@inspur.com>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: ti-sysc: convert sysfs sprintf to sysfs_emit
Message-ID: <20230531050458.GR14287@atomide.com>
References: <20230504085522.2635-1-liubo03@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504085522.2635-1-liubo03@inspur.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Bo Liu <liubo03@inspur.com> [230504 11:55]:
> Follow the advice of the Documentation/filesystems/sysfs.rst
> and show() should only use sysfs_emit() or sysfs_emit_at()
> when formatting the value to be returned to user space.

Thanks applying into omap-for-v6.5/ti-sysc.

Tony
