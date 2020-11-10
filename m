Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BEB32AD7D8
	for <lists+linux-omap@lfdr.de>; Tue, 10 Nov 2020 14:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730345AbgKJNkp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Nov 2020 08:40:45 -0500
Received: from muru.com ([72.249.23.125]:47988 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730231AbgKJNkp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Nov 2020 08:40:45 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3FC0A80BA;
        Tue, 10 Nov 2020 13:40:51 +0000 (UTC)
Date:   Tue, 10 Nov 2020 15:40:41 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     sre@kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/1] power: supply: cpcap-battery: improve handling of
 3rd party batteries.
Message-ID: <20201110134041.GN26857@atomide.com>
References: <20201031125650.768df90568d54b1dcf3bb10c@uvos.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201031125650.768df90568d54b1dcf3bb10c@uvos.xyz>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Carl Philipp Klemm <philipp@uvos.xyz> [201031 11:57]:
> Adds a module option to ignore a missing temerature sensor. Usefull for
> 3rd party batteries.

Looks OK to me:

Acked-by: Tony Lindgren <tony@atomide.com>
