Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82609191832
	for <lists+linux-omap@lfdr.de>; Tue, 24 Mar 2020 18:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbgCXRwY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Mar 2020 13:52:24 -0400
Received: from muru.com ([72.249.23.125]:33170 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727630AbgCXRwY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 24 Mar 2020 13:52:24 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 90F9381CA;
        Tue, 24 Mar 2020 17:53:10 +0000 (UTC)
Date:   Tue, 24 Mar 2020 10:52:20 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     gregkh@linuxfoundation.org, vigneshr@ti.com, nsekhar@ti.com,
        t-kristo@ti.com, tomi.valkeinen@ti.com,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] serial: 8250_omap: Fix sleeping function called from
 invalid context during probe
Message-ID: <20200324175220.GD37466@atomide.com>
References: <20200320125200.6772-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320125200.6772-1-peter.ujfalusi@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Peter Ujfalusi <peter.ujfalusi@ti.com> [200320 12:52]:
> To fix the bug we need to first call pm_runtime_enable() prior to any
> pm_runtime calls.

Acked-by: Tony Lindgren <tony@atomide.com>
