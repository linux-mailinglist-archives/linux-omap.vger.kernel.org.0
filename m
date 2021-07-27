Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C78D33D7153
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 10:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235913AbhG0Il5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 04:41:57 -0400
Received: from muru.com ([72.249.23.125]:55634 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235629AbhG0Il5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 04:41:57 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9BACB80F0;
        Tue, 27 Jul 2021 08:42:14 +0000 (UTC)
Date:   Tue, 27 Jul 2021 11:41:55 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     David Lechner <david@lechnology.com>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Drew Fustini <drew@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: am335x-boneblue: add gpio-line-names
Message-ID: <YP/G09uOO6DxUfVG@atomide.com>
References: <20210709214706.1583984-1-david@lechnology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709214706.1583984-1-david@lechnology.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* David Lechner <david@lechnology.com> [210710 00:49]:
> This adds gpio-line-names to the BeagleBone Blue DTS. The line names
> are based on the BeagleBone Blue rev A2 schematic.

Thanks applying into omap-for-v5.14/dt. I had to merge with the change
for ls-buf-en-hog so please check after I push out the branch a bit later
on.

Regards,

Tony
