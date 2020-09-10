Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9F5D2642A0
	for <lists+linux-omap@lfdr.de>; Thu, 10 Sep 2020 11:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730193AbgIJJnu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Sep 2020 05:43:50 -0400
Received: from muru.com ([72.249.23.125]:44482 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730085AbgIJJnh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 10 Sep 2020 05:43:37 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E4DB880F9;
        Thu, 10 Sep 2020 09:43:31 +0000 (UTC)
Date:   Thu, 10 Sep 2020 12:44:09 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/1] ARM: dts: n9, n950: Remove nokia,nvm-size property
Message-ID: <20200910094409.GA7101@atomide.com>
References: <20200904065811.9312-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904065811.9312-1-sakari.ailus@linux.intel.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Sakari Ailus <sakari.ailus@linux.intel.com> [200904 10:02]:
> Remove nokia,nvm-size property as it is no longer needed. The driver can
> nowadays figure out the size so do not specify it in DT.

Thanks applying into omap-for-v5.10/dt.

Regards,

Tony
