Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3D14DF45C
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 19:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727344AbfJURgp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 13:36:45 -0400
Received: from muru.com ([72.249.23.125]:38658 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727110AbfJURgp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Oct 2019 13:36:45 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C71DB822C;
        Mon, 21 Oct 2019 17:37:19 +0000 (UTC)
Date:   Mon, 21 Oct 2019 10:36:42 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-arm-kernel@lists.infraread.org,
        linux-kernel@lists.codethink.co.uk, linux-omap@vger.kernel.org
Subject: Re: [PATCH 07/11] ARM: OMAP2+: prm44xx: make
 prm_{save,restore}_context static
Message-ID: <20191021173642.GE5610@atomide.com>
References: <20191008123341.1551-1-ben.dooks@codethink.co.uk>
 <20191008123341.1551-7-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008123341.1551-7-ben.dooks@codethink.co.uk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ben Dooks <ben.dooks@codethink.co.uk> [191008 05:34]:
> The prm_{save,restore}_context functions are not exported
> so make them static to avoid the following warnings:
> 
> arch/arm/mach-omap2/prm44xx.c:748:6: warning: symbol 'prm_save_context' was not declared. Should it be static?
> arch/arm/mach-omap2/prm44xx.c:759:6: warning: symbol 'prm_restore_context' was not declared. Should it be static?

Applying into omap-for-v5.5/soc thanks.

Tony
