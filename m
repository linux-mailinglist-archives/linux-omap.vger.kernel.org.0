Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2C36C9D18
	for <lists+linux-omap@lfdr.de>; Mon, 27 Mar 2023 10:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbjC0ICc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Mar 2023 04:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjC0ICc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Mar 2023 04:02:32 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7CDEB4225
        for <linux-omap@vger.kernel.org>; Mon, 27 Mar 2023 01:02:31 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id BF6C78108;
        Mon, 27 Mar 2023 08:02:30 +0000 (UTC)
Date:   Mon, 27 Mar 2023 11:02:29 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     paul@pwsan.com, linux@armlinux.org.uk, khilman@kernel.org,
        daniel@zonque.org, haojian.zhuang@gmail.com,
        robert.jarzmik@free.fr, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] Remove unused declarations from arm
Message-ID: <20230327080229.GC7501@atomide.com>
References: <20220920130110.1104272-1-cuigaosheng1@huawei.com>
 <Y2tiucLEcPyTTmwv@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2tiucLEcPyTTmwv@atomide.com>
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [221109 08:10]:
> Hi,
> 
> * Gaosheng Cui <cuigaosheng1@huawei.com> [220920 15:53]:
> > This series contains a few cleanup patches, to remove unused
> > declarations which have been removed. Thanks!
> 
> FYI, let's wait a bit longer with these until we have Arnd's pending
> clean-up patches in Linux next as they remove some unused functions
> too.

Looks like the two omap related patch in this series are no longer
needed after Arnd's clean-up has been merged. If I missed something,
please resend updated patches.

Thanks,

Tony
