Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF8E7DC6E6
	for <lists+linux-omap@lfdr.de>; Tue, 31 Oct 2023 08:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343497AbjJaHHP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 31 Oct 2023 03:07:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343495AbjJaHHO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 31 Oct 2023 03:07:14 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2C2ADBB
        for <linux-omap@vger.kernel.org>; Tue, 31 Oct 2023 00:07:11 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 32E42809C;
        Tue, 31 Oct 2023 07:07:10 +0000 (UTC)
Date:   Tue, 31 Oct 2023 09:07:08 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     linux-omap@vger.kernel.org
Subject: Re: ti-sysc: probe of 4a318000.target-module failed with error -16
Message-ID: <20231031070708.GA44202@atomide.com>
References: <20231029101249.2cc84607@akair>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231029101249.2cc84607@akair>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andreas Kemnade <andreas@kemnade.info> [231029 09:13]:
> I am seeing the error message from $subject on omap4 devices regularly,
> on omap4430-panda and on the epson bt200 (omap4460).
> While not having the timer seems not critical in itself. I am wondering
> whether something nasty is behind it which might cause more severe
> problems.
> Is this really seen everywhere?

That should be for gptimer1 that is used as a clocksource by the
drivers/clocksource/timer-ti-dm-systimer.c driver, and ti-sysc will
ignore it.

Maybe we should not show the error for timers, or change it to
dev_info if EBUSY and timer?

Regards,

Tony
