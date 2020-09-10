Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 870C4264372
	for <lists+linux-omap@lfdr.de>; Thu, 10 Sep 2020 12:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbgIJKOY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Sep 2020 06:14:24 -0400
Received: from muru.com ([72.249.23.125]:44546 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgIJKOX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 10 Sep 2020 06:14:23 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 41B1E80F9;
        Thu, 10 Sep 2020 10:14:24 +0000 (UTC)
Date:   Thu, 10 Sep 2020 13:15:06 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: omap2plus_defconfig: enable generic net options
Message-ID: <20200910101506.GG7101@atomide.com>
References: <20200830173401.14825-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200830173401.14825-1-grygorii.strashko@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [200830 20:34]:
> Enable set of generic, widely used, networking  options:
> - basic QoS, filter and actions
> - VLAN support
> - Bridge support
> Use "M" build option where possible.

Thanks applying into omap-for-v5.10/defconfig.

Tony
