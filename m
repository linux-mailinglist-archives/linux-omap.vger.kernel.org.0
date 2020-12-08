Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDC102D2C6B
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 14:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729352AbgLHN5a (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 08:57:30 -0500
Received: from muru.com ([72.249.23.125]:49852 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729678AbgLHN5X (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Dec 2020 08:57:23 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E66678096;
        Tue,  8 Dec 2020 13:56:50 +0000 (UTC)
Date:   Tue, 8 Dec 2020 15:56:39 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     Kevin Hilman <khilman@kernel.org>, linux-omap@vger.kernel.org
Subject: Re: ARM: omap2: pmic-cpcap: fix maximum voltage to be consistent
 with defaults on xt875
Message-ID: <20201208135639.GC26857@atomide.com>
References: <20201207205801.7c830144e5d4212c7aadb615@uvos.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207205801.7c830144e5d4212c7aadb615@uvos.xyz>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Carl Philipp Klemm <philipp@uvos.xyz> [201207 21:58]:
> xt875 comes up with a iva voltage of 1375000 and android runs at this too. fix 
> maximum voltage to be consistent with this.

Thanks applying into fixes.

Tony
