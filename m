Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8CF3D719D
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 10:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235956AbhG0IzX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 04:55:23 -0400
Received: from muru.com ([72.249.23.125]:55684 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235940AbhG0IzW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 04:55:22 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6E03E80F0;
        Tue, 27 Jul 2021 08:55:40 +0000 (UTC)
Date:   Tue, 27 Jul 2021 11:55:21 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Paul Barker <paul.barker@sancloud.com>
Cc:     Robert Nelson <robertcnelson@gmail.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Add support for the SanCloud BBE Lite
Message-ID: <YP/J+YC6GFeH+I5j@atomide.com>
References: <20210720083928.10404-1-paul.barker@sancloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720083928.10404-1-paul.barker@sancloud.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Paul Barker <paul.barker@sancloud.com> [210720 11:40]:
> The Lite variant of the SanCloud BeagleBone Enhanced (BBE) removes the
> HDMI encoder, barometer and accelerometer chips and adds a Micron
> Authenta SPI flash chip.

Thanks applying all for v5.15 merge window.

Regards,

Tony
