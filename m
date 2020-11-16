Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D152B3F8C
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 10:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728541AbgKPJJh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 04:09:37 -0500
Received: from muru.com ([72.249.23.125]:48390 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728540AbgKPJJh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 04:09:37 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A93ED80C8;
        Mon, 16 Nov 2020 09:09:43 +0000 (UTC)
Date:   Mon, 16 Nov 2020 11:09:33 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     linux-omap@vger.kernel.org
Subject: Re: [PATCH v3] ARM: omap2plus_defconfig: add CONFIG_AK8975=m and
 CONFIG_KXCJK1013=m to support motorola xt894's magnetometer and motorola
 xt875's accelerometer respectivly
Message-ID: <20201116090933.GC26857@atomide.com>
References: <20201108195320.c63629247da05afe1dedeacc@uvos.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201108195320.c63629247da05afe1dedeacc@uvos.xyz>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Carl Philipp Klemm <philipp@uvos.xyz> [201108 20:53]:
> ARM: omap2plus_defconfig: add CONFIG_AK8975=m and CONFIG_KXCJK1013=m to
> support motorola xt894's magnetometer and motorola xt875's
> accelerometer respectivly

Thanks applying into omap-for-v5.11/defconfig.

Tony
