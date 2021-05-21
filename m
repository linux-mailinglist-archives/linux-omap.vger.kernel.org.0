Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D400838C2CD
	for <lists+linux-omap@lfdr.de>; Fri, 21 May 2021 11:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235567AbhEUJOZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 May 2021 05:14:25 -0400
Received: from muru.com ([72.249.23.125]:58320 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234287AbhEUJOX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 May 2021 05:14:23 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D5C5880C0;
        Fri, 21 May 2021 09:13:03 +0000 (UTC)
Date:   Fri, 21 May 2021 12:12:56 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Juerg Haefliger <juerg.haefliger@canonical.com>
Cc:     aaro.koskinen@iki.fi, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        juergh@canonical.com
Subject: Re: [PATCH] ARM: OMAP1: Remove leading spaces in Kconfig
Message-ID: <YKd5mHlraOior0iI@atomide.com>
References: <20210517095809.81478-1-juergh@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517095809.81478-1-juergh@canonical.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Juerg Haefliger <juerg.haefliger@canonical.com> [210517 12:58]:
> Remove leading spaces before tabs in Kconfig file(s) by running the
> following command:
> 
>   $ find arch/arm/mach-omap1 -name 'Kconfig*' | \
>     xargs sed -r -i 's/^[ ]+\t/\t/'

Thanks applying into omap-for-v5.14/cleanup.

Tony
