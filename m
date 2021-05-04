Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5893B372A5E
	for <lists+linux-omap@lfdr.de>; Tue,  4 May 2021 14:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbhEDMvf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 May 2021 08:51:35 -0400
Received: from muru.com ([72.249.23.125]:51524 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230256AbhEDMvf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 4 May 2021 08:51:35 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4319080E2;
        Tue,  4 May 2021 12:50:42 +0000 (UTC)
Date:   Tue, 4 May 2021 15:50:37 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Mighty M <mightymb17@gmail.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: Performance difference in mainline and downstream
Message-ID: <YJFDHfRc1Q02gh/k@atomide.com>
References: <CACLAQJFHyYESWO0_N8Qin8eY2moswN-eeWi5bHcRWhCJpjsjjg@mail.gmail.com>
 <YI/ONvCE4RuUV6SC@atomide.com>
 <CACLAQJH6tgaSqH=hs-=WEOWmD6ozkkRkL_dm0MBNV5qiPHFveg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACLAQJH6tgaSqH=hs-=WEOWmD6ozkkRkL_dm0MBNV5qiPHFveg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Mighty M <mightymb17@gmail.com> [210504 06:02]:
> Hello, CONFIG_ARCH_OMAP2 is already disabled in my .config and I
> couldnt find CONFIG_DEBUG.

Sorry I meant CONFIG_DEBUG_KERNEL :)

Try first dropping these lines from your .config:

CONFIG_EXPERT=y
CONFIG_DEBUG_KERNEL=y

Regards,

Tony
