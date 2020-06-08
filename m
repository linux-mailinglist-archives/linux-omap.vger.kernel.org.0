Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D848F1F1DF9
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jun 2020 19:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730722AbgFHRBg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Jun 2020 13:01:36 -0400
Received: from muru.com ([72.249.23.125]:57302 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730718AbgFHRBf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Jun 2020 13:01:35 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 15C348138;
        Mon,  8 Jun 2020 17:02:26 +0000 (UTC)
Date:   Mon, 8 Jun 2020 10:01:32 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Oskar Holmlund <info@ohdata.se>
Cc:     linux-omap@vger.kernel.org, bcousson@baylibre.com
Subject: Re: PATCH: ARM: am33xx.dtsi ti,sysc-mask wrong softreset flag
Message-ID: <20200608170132.GJ37466@atomide.com>
References: <d5f2bd51988130c1220179dbf54df62d@ohdata.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5f2bd51988130c1220179dbf54df62d@ohdata.se>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Oskar Holmlund <info@ohdata.se> [200605 17:41]:
> AM335x TRM: Figure 16-23 define sysconfig register and soft_reset
> are in first position corresponding to SYSC_OMAP4_SOFTRESET defined
> in ti-sysc.h.

Applying this too to fixes thanks. This one also had
issues applying FYI.

Regards,

Tony
