Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2032FFCB35
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2019 17:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbfKNQ6s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Nov 2019 11:58:48 -0500
Received: from muru.com ([72.249.23.125]:42262 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726214AbfKNQ6s (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 Nov 2019 11:58:48 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D678D80E7;
        Thu, 14 Nov 2019 16:59:24 +0000 (UTC)
Date:   Thu, 14 Nov 2019 08:58:45 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, adam.ford@logicpd.com
Subject: Re: [PATCH] ARM: dts: logicpd-torpedo: Remove unnecessary
 notes/comments
Message-ID: <20191114165845.GT5610@atomide.com>
References: <20191113120557.6438-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113120557.6438-1-aford173@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [191113 04:06]:
> There used to be a bug in the video driver that caused the timings
> for the LCD to calculate in a way on the DM3730 which made it hang.
> 
> The work around for this bug was to set
> CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=4 in the kernel.  This work around
> is no longer needed as the video drivers have been corrected.
> 
> This patch removes the legacy note.

Applying into omap-for-v5.5/dt thanks. Again not sure if this will
make it for the merge window, but we'll see.

Regards,

Tony
