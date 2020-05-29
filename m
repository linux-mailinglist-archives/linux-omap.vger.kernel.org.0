Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4B5C1E861F
	for <lists+linux-omap@lfdr.de>; Fri, 29 May 2020 20:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgE2SB0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 May 2020 14:01:26 -0400
Received: from muru.com ([72.249.23.125]:56226 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725808AbgE2SB0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 29 May 2020 14:01:26 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8826F8030;
        Fri, 29 May 2020 18:02:16 +0000 (UTC)
Date:   Fri, 29 May 2020 11:01:23 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 8/8] ARM: OMAP2: Use custom soc attribute group instead
 of device_create_file
Message-ID: <20200529180123.GV37466@atomide.com>
References: <20200523170859.50003-1-sudeep.holla@arm.com>
 <20200523170859.50003-9-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200523170859.50003-9-sudeep.holla@arm.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Sudeep Holla <sudeep.holla@arm.com> [200523 17:10]:
> Commit c31e73121f4c ("base: soc: Handle custom soc information sysfs
> entries") introduced custom soc attribute group in soc_device_attribute
> structure but there are no users treewide. While trying to understand
> the motivation and tried to use it, it was found lot of existing custom
> attributes can moved to use it instead of device_create_file.
> 
> Though most of these never remove/cleanup the custom attribute as they
> never call soc_device_unregister, using these custom attribute group
> eliminate the need for any cleanup as the driver infrastructure will
> take care of that.
> 
> Let us remove device_create_file and start using the custom attribute
> group in soc_device_attribute.

Acked-by: Tony Lindgren <tony@atomide.com>
