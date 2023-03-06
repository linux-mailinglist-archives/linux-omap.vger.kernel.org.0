Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD2856AB730
	for <lists+linux-omap@lfdr.de>; Mon,  6 Mar 2023 08:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjCFHmD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Mar 2023 02:42:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjCFHmC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Mar 2023 02:42:02 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 25BEC1E1F6
        for <linux-omap@vger.kernel.org>; Sun,  5 Mar 2023 23:42:02 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 813838027;
        Mon,  6 Mar 2023 07:42:01 +0000 (UTC)
Date:   Mon, 6 Mar 2023 09:42:00 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>, Bin Liu <b-liu@ti.com>,
        Johan Hovold <johan@kernel.org>
Subject: Re: am335x: performnce issues with FTDI and LOW_LATENCY
Message-ID: <20230306074200.GD7501@atomide.com>
References: <CAGm1_kuc0T5xqdQU0JVbetz+pMZb2=v=jhpgmfvZQhAiPdAG=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm1_kuc0T5xqdQU0JVbetz+pMZb2=v=jhpgmfvZQhAiPdAG=A@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Yegor Yefremov <yegorslists@googlemail.com> [230228 08:01]:
> Any idea why the performance drop is so big?

Maybe lots of interrupts and dma not being used for musb in this case?

Tony
