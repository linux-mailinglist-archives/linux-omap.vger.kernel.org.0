Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1523B451
	for <lists+linux-omap@lfdr.de>; Mon, 10 Jun 2019 14:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389241AbfFJMGA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 10 Jun 2019 08:06:00 -0400
Received: from muru.com ([72.249.23.125]:52516 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389229AbfFJMGA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 10 Jun 2019 08:06:00 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 713C080CD;
        Mon, 10 Jun 2019 12:06:21 +0000 (UTC)
Date:   Mon, 10 Jun 2019 05:05:57 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, adam.ford@logicpd.com
Subject: Re: [PATCH] ARM: dts: Add LCD type 28 support to LogicPD Torpedo
 DM3730 devkit
Message-ID: <20190610120557.GW5447@atomide.com>
References: <20190510202256.25050-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510202256.25050-1-aford173@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [190510 13:23]:
> There are two LCD device released by Logic PD for the Torpedo,
> type 15 and Type 28.  The stock dts file supports the older LCD,
> so this patch enables support for the newer one.
> 
> For details between these different LCD's see
> https://support.logicpd.com/DesktopModules/Bring2mind/DMX/Download.aspx?portalid=0&EntryId=2777

Thanks applying into omap-for-v5.3/dt.

Regards,

Tony
