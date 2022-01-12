Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF7D48BD6A
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jan 2022 03:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348652AbiALCuz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Jan 2022 21:50:55 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:51578 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236450AbiALCuy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Jan 2022 21:50:54 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 565E7B81DBC;
        Wed, 12 Jan 2022 02:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30E7C36AEB;
        Wed, 12 Jan 2022 02:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641955852;
        bh=Mb6jh+8Uks2RYwUejHIchpcCrsvLyepVBnUjuWUy97M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MdHv2pNoVkfSdbLtf0XWb157+B3bSD6etaYZ6SLinb/HmuQ5YrFzGoKYVqt65nSvZ
         pzSfpnEhyO9Kb0aFR7o+vikttcSN1q5GvMIATVnZUltdvME5DytJwMcE1+AgXKjx5G
         Bey/9pEXRrqNBj1ivNz52TS7z3bdUM9H4wKgjy5n9G+7zjzt6c5/maBp01PhQtuk4r
         D+lKRTTFuwAfW+uPr+yj33x7NgLmqtpKA79BdbG/KYcml1WQ+ywT9Y6+1YoOBO7Riu
         /K9rKLYuvY50XDGJlCSvpYVOByYJAoXUOvBELLqcv2k+5hV1MHtGgOyL6OkK7mwmOm
         loRm9VRByG4ww==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211217115559.15352-1-tony@atomide.com>
References: <20211217115559.15352-1-tony@atomide.com>
Subject: Re: [PATCH 1/2] clk: ti: Move dra7 clock devices out of the legacy section
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     =?utf-8?q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Tero Kristo <kristo@kernel.org>
To:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Date:   Tue, 11 Jan 2022 18:50:50 -0800
User-Agent: alot/0.9.1
Message-Id: <20220112025051.F30E7C36AEB@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2021-12-17 03:55:58)
> I accidentally added some dra7 clock defines to the legacy section that
> we want to stop using. Let's move the defines to the right location.
> Note that this is just a cosmetic fix.
>=20
> Cc: linux-clk@vger.kernel.org
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Tero Kristo <kristo@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
