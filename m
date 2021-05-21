Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18CAC38C319
	for <lists+linux-omap@lfdr.de>; Fri, 21 May 2021 11:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232374AbhEUJbt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 May 2021 05:31:49 -0400
Received: from muru.com ([72.249.23.125]:58390 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231584AbhEUJ3s (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 May 2021 05:29:48 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4C5D380C0;
        Fri, 21 May 2021 09:28:30 +0000 (UTC)
Date:   Fri, 21 May 2021 12:28:22 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Dario Binacchi <dariobin@libero.it>
Cc:     linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [RESEND PATCH] ARM: OMAP2+: CM: remove omap2_set_globals_cm()
Message-ID: <YKd9NjEobccoSn6a@atomide.com>
References: <20210425142208.20159-1-dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210425142208.20159-1-dariobin@libero.it>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Dario Binacchi <dariobin@libero.it> [210425 17:22]:
> The function is no longer used, so let's remove it.

Thanks applying into omap-for-v5.14/cleanup.

Tony
