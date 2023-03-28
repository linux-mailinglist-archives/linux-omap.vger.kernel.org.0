Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46E2B6CB62E
	for <lists+linux-omap@lfdr.de>; Tue, 28 Mar 2023 07:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjC1Fmm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Mar 2023 01:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjC1Fml (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Mar 2023 01:42:41 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 05CB11BFD;
        Mon, 27 Mar 2023 22:42:41 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 558248108;
        Tue, 28 Mar 2023 05:42:40 +0000 (UTC)
Date:   Tue, 28 Mar 2023 08:42:39 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Jilin Yuan <yuanjilin@cdjrlc.com>
Cc:     linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP2+: fix repeated words in comments
Message-ID: <20230328054239.GK7501@atomide.com>
References: <20220914084315.40165-1-yuanjilin@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914084315.40165-1-yuanjilin@cdjrlc.com>
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Jilin Yuan <yuanjilin@cdjrlc.com> [220914 11:35]:
> Delete the redundant word 'from'.

Thanks applying into omap-for-v6.4/cleanup.

Tony
