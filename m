Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE655AFBA6
	for <lists+linux-omap@lfdr.de>; Wed,  7 Sep 2022 07:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiIGFTv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Sep 2022 01:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbiIGFTr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Sep 2022 01:19:47 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7313113FA7
        for <linux-omap@vger.kernel.org>; Tue,  6 Sep 2022 22:19:45 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id F0B3580E1;
        Wed,  7 Sep 2022 05:12:06 +0000 (UTC)
Date:   Wed, 7 Sep 2022 08:19:43 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     yegorslists@googlemail.com
Cc:     linux-omap@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v2 1/5] ARM: dts: am335x-baltos: add GPIO names for
 ir3220 and ir5221 devices
Message-ID: <Yxgp71Sm6EoRyKIa@atomide.com>
References: <20220726083444.10159-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726083444.10159-1-yegorslists@googlemail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* yegorslists@googlemail.com <yegorslists@googlemail.com> [220726 11:28]:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Add GPIO names for both SoC and TCA6416 lines.

Thanks applying all into omap-for-v6.1/dt.

Regards,

Tony
