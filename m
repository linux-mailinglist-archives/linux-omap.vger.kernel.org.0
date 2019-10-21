Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32C6CDF44F
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 19:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbfJURbj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 13:31:39 -0400
Received: from muru.com ([72.249.23.125]:38624 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727517AbfJURbi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Oct 2019 13:31:38 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 63266810A;
        Mon, 21 Oct 2019 17:32:13 +0000 (UTC)
Date:   Mon, 21 Oct 2019 10:31:35 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-arm-kernel@lists.infraread.org,
        linux-kernel@lists.codethink.co.uk, linux-omap@vger.kernel.org
Subject: Re: [PATCH 06/11] ARM: OMAP2+: do not export am43xx_control functions
Message-ID: <20191021173135.GC5610@atomide.com>
References: <20191008123341.1551-1-ben.dooks@codethink.co.uk>
 <20191008123341.1551-6-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008123341.1551-6-ben.dooks@codethink.co.uk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ben Dooks <ben.dooks@codethink.co.uk> [191008 05:34]:
> Do not export am43xx_control_{save,restore}_context to avoid
> the foloowing warnings:
> 
> arch/arm/mach-omap2/control.c:687:6: warning: symbol 'am43xx_control_save_context' was not declared. Should it be static?
> arch/arm/mach-omap2/control.c:701:6: warning: symbol 'am43xx_control_restore_context' was not declared. Should it be static?

Applying into omap-for-v5.5/soc thanks.

Tony
