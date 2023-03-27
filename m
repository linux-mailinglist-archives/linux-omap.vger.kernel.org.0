Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3A36C9C53
	for <lists+linux-omap@lfdr.de>; Mon, 27 Mar 2023 09:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232718AbjC0Hhv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Mar 2023 03:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232672AbjC0Hhl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Mar 2023 03:37:41 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 917F84EFB;
        Mon, 27 Mar 2023 00:36:58 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 424CD8108;
        Mon, 27 Mar 2023 07:36:56 +0000 (UTC)
Date:   Mon, 27 Mar 2023 10:36:55 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Shaomin Deng <dengshaomin@cdjrlc.com>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: ti-sysc: Fix double word in comments
Message-ID: <20230327073655.GY7501@atomide.com>
References: <20220825145510.6549-1-dengshaomin@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825145510.6549-1-dengshaomin@cdjrlc.com>
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Shaomin Deng <dengshaomin@cdjrlc.com> [220825 17:48]:
> Delete the repeated word "the" in line 918.

FYI, I'm applying an earlier similar patch from Jason Wang.

Regards,

Tony
