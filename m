Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 475C0A8989
	for <lists+linux-omap@lfdr.de>; Wed,  4 Sep 2019 21:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730330AbfIDP1y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Sep 2019 11:27:54 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:46989 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729888AbfIDP1y (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Sep 2019 11:27:54 -0400
Received: by mail-qt1-f193.google.com with SMTP id v11so3912188qto.13
        for <linux-omap@vger.kernel.org>; Wed, 04 Sep 2019 08:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p7b1N8V85LqqEm2j0DjuNlUk7tSxTDqCBvfRkD4FVBk=;
        b=aRcucBvym+ylWzxM4DlQy7U0L3+abow1vJtNeGKQ2LrULUUESKC5+BCGZ6vZOAdudI
         98E1pwwbdE2l/IAGg/GLLUM70PArNLpkQNCkEl80Y164NUehiUWH8vrRarjeLfikZoJp
         rikzXGynv9ILlaAHBbOOfSZTL17Ru6MZ5F+A9aD6HO8p3QXolKgWEbNqG0b2UDOAbS5C
         kZpkSPFnTC6tB/Z8gVTk5Ukas9iS31k3Kp3tJH2m+DKQ0d4ZVn5iJHzuia9bql6f6Fte
         GdjjMXB91lzV24+zRYOQWUGkbl5nCWCLPJWEJZN2vSUpayzGRKem+VzHELziST3PG+Dk
         Jo8A==
X-Gm-Message-State: APjAAAVMATfAJ/CYgezMhGHRNnjOZvqPwFOtQO3FbFGJnmQfjifxqg9W
        AbIoGLnlUM/vtzEy2RCCeNHYaOvn7lo3nE6decw=
X-Google-Smtp-Source: APXvYqwkiPu26IlSxkELMZVjYeJUYP0BO8lUlliTVxXz6my62r+JkrcYBpRgkTlLiQ8k7N29cbbOIPUKvaa9ZMXax8Y=
X-Received: by 2002:ac8:6b1a:: with SMTP id w26mr15937751qts.304.1567610873621;
 Wed, 04 Sep 2019 08:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <pull-1567016893-318461@atomide.com> <pull-1567016893-318461@atomide.com-4>
In-Reply-To: <pull-1567016893-318461@atomide.com-4>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 4 Sep 2019 17:27:37 +0200
Message-ID: <CAK8P3a1s2go50eYiWQw5DCUEajy2QozKKfs4_Uo6xWUKL3eyrA@mail.gmail.com>
Subject: Re: [GIT PULL 4/4] sgx soc glue changes for omaps for v5.4
To:     Tony Lindgren <tony@atomide.com>
Cc:     SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Aug 28, 2019 at 8:35 PM Tony Lindgren <tony@atomide.com> wrote:
> SoC glue layer changes for SGX on omap variants for v5.4
>
> For a while we've had omap4 sgx glue layer defined in dts and probed
> with ti-sysc driver. This allows idling the sgx module for PM, and
> removes the need for custom platform glue layer code for any further
> driver changes.
>
> We first drop the unused legacy platform data for omap4 sgx. Then for
> omap5, we need add the missing clkctrl clock data so we can configure
> sgx. And we configure sgx for omap34xx, omap36xx and am3517.
>
> For am335x, we still have a dependency for rstctrl reset driver changes,
> so that will be added later on.
>
> Note that this branch is based on earlier ti-sysc branch for omap36xx
> glue layer quirk handling.

Pulled into arm/late, thanks!

        Arnd
