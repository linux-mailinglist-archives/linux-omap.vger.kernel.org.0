Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0981C509F50
	for <lists+linux-omap@lfdr.de>; Thu, 21 Apr 2022 14:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354455AbiDUMLc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Apr 2022 08:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351963AbiDUMLc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Apr 2022 08:11:32 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 30CAD25C57;
        Thu, 21 Apr 2022 05:08:43 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1C0978106;
        Thu, 21 Apr 2022 12:05:51 +0000 (UTC)
Date:   Thu, 21 Apr 2022 15:08:41 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     yegorslists@googlemail.com
Cc:     linux-omap@vger.kernel.org, bcousson@baylibre.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: am335x-baltos: update MPU regulator range
Message-ID: <YmFJSTr7KfLgzzME@atomide.com>
References: <20220419143923.25196-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419143923.25196-1-yegorslists@googlemail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* yegorslists@googlemail.com <yegorslists@googlemail.com> [220419 17:36]:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Update the max MPU voltage range to align with the maximum
> possible value allowed in the operating-points table, which is max
> target voltage of 132500 uV + 2%.

Applying into omap-for-v5.19/dt thanks.

Tony
