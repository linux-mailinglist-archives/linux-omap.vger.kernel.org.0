Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6EE3A08B0
	for <lists+linux-omap@lfdr.de>; Wed,  9 Jun 2021 02:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231837AbhFIAyJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Jun 2021 20:54:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:54806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235221AbhFIAyJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Jun 2021 20:54:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5ED93613AD;
        Wed,  9 Jun 2021 00:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623199935;
        bh=RDqO+r4z4WqAW+2/VcwEVBlvIh3ptokTewvKTgMIiwM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fIW9P4mZnNT77sMRWS7eqfMJDkCame65dzO654rts75NgS6XUnsOGOBoh1jrNiv20
         e1SHBQutiUfS0eJOaARw8tewkxY4g1BiDLCNZPLkRr6ivqmImRb88Pta6dfsMbL3mo
         gx8/5KG6WlNVCDEzdlhWUhDfcyAhdpYunbvBtvQW2ibDKNDVsWr48Wmv1i9VBE9Td3
         qzfBs9A2N++aBGKN/iC6VlLIEDqGeiLdAx61zVxlLQOzHOqByL3N4jljigOJU+oeVy
         Qzg68+1nPnZvl/Q3WBGN8H07Y91T+iYSiM7rlSD6P2tORn3cl8fDD/nT7lFKvM8C3Q
         CYlE9FsAkYX7w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210606202253.31649-3-dariobin@libero.it>
References: <20210606202253.31649-1-dariobin@libero.it> <20210606202253.31649-3-dariobin@libero.it>
Subject: Re: [RESEND PATCH v7 2/5] dt-bindings: ti: dpll: add spread spectrum support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dario Binacchi <dariobin@libero.it>,
        linux-omap@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        =?utf-8?q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
To:     Dario Binacchi <dariobin@libero.it>, linux-clk@vger.kernel.org
Date:   Tue, 08 Jun 2021 17:52:13 -0700
Message-ID: <162319993380.1835121.1812196853786432045@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Dario Binacchi (2021-06-06 13:22:50)
> DT bindings for enabling and adjusting spread spectrum clocking have
> been added.
>=20
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> Reviewed-by: Rob Herring <robh@kernel.org>
>=20
> ---

Applied to clk-next
