Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 322B0E6F72
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2019 10:59:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732677AbfJ1J7H (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Oct 2019 05:59:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:44522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728915AbfJ1J7G (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 28 Oct 2019 05:59:06 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 27043208C0;
        Mon, 28 Oct 2019 09:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572256746;
        bh=ZwCgdPO2OUFOVEtZ6oM47tcFLWltuu8H2EOv4DYqqIo=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=E9zqCHxMnovZc/WH0DVrG0OvJlApNtVho8JJ5HyCFjFottSnAMeLCOuFbh0MjG8sk
         FfOvvan3GJXiabCvwPhDoPObSQjDrBoC+Gzq4nHniDPe0rAjSqYYFkMM8KZcsZB0P1
         t4PB/RNlwtfYyfN4eaQsUs9VH9vQ2DvdMw7pMRVg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1115e221-1523-1a60-02a3-1f1939170e64@ti.com>
References: <20191002120611.26121-1-t-kristo@ti.com> <1115e221-1523-1a60-02a3-1f1939170e64@ti.com>
Cc:     linux-omap@vger.kernel.org, tony@atomide.com, aford173@gmail.com,
        tomi.valkeinen@ti.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 0/4] clk: ti: re-work divider clock support
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
User-Agent: alot/0.8.1
Date:   Mon, 28 Oct 2019 02:59:05 -0700
Message-Id: <20191028095906.27043208C0@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tero Kristo (2019-10-24 01:03:20)
> On 02/10/2019 15:06, Tero Kristo wrote:
> > Hi,
> >=20
> > The existing divider clock support appears to have an inherent bug
> > because of the bit field width implementation and limitation of divider
> > values based on this. The limitation by bit field only is not enough,
> > as we can have divider settings which accept only certain range of
> > dividers within the full range of the bit-field.
> >=20
> > Because of this, the divider clock is re-implemented to use min,max,mask
> > values instead of just the bit-field.
>=20
> Queued this up for 5.4 fixes, thanks.

Is this a regression in 5.4-rc series? Please only send fixes for code
that is broken by code that went into the merge window, or is super
annoying and broken but we somehow didn't notice. If not, just let it
sit in -next until the next merge window and it may still be backported
to stable trees anyway.

