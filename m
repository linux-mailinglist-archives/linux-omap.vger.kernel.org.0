Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAF0A8984
	for <lists+linux-omap@lfdr.de>; Wed,  4 Sep 2019 21:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730135AbfIDP0i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Sep 2019 11:26:38 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:42472 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730011AbfIDP0h (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Sep 2019 11:26:37 -0400
Received: by mail-qt1-f196.google.com with SMTP id t12so24809229qtp.9
        for <linux-omap@vger.kernel.org>; Wed, 04 Sep 2019 08:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DABWG+eaL7f1l3FkKdJb8DYEm6uMRDe9I7ADfmro334=;
        b=FPQPP/t4Ao0azhSrbMj4OJWMhxlr/Ny6rr1yJAJzJse9ZSVvUZx6JUDHtx2VQYQQF1
         IFy5bvwYKvT+jDzSo29YXGyqdYB1QrgRKft1eaiI+0d4kZLhJOM2PK842fmzjMNVYqY9
         GfxRGsPcslFyuW8vBwO77gqgeFbgDkw8fuNBrHOmuHyc4t8ikiWTG15gnHDvwhkicqj+
         rIyEBxtzRjQonwRqlr3LNgZfeKWNVb9C9GrmVGxlQIy1W36fXkrUjVM6gNz9ck+XT0F5
         Rd9tUs/87EFdfzhJqbEzrD94dFgrG1zU8kX9pToppEP7hkYZhwmrOUpivOMCYh1wlu/n
         JiDA==
X-Gm-Message-State: APjAAAUn7ZRyjVcVHMW8enF6GkC5Kv8hm4a18wNWLTFrb7Ag8QNuJelO
        j1oHg7Xig2lzrssziBOLl6lzJhXGGiZOT/6WI3v1wA==
X-Google-Smtp-Source: APXvYqwZyMKAoyunn/3lv5bd8d4pnIpPJThQ/mKRZx5bTL2Yk9viBbGlJNtSjIv6XKutfivLFx/WQuEZsR6dtCrBUns=
X-Received: by 2002:a0c:e74b:: with SMTP id g11mr25545961qvn.62.1567610796803;
 Wed, 04 Sep 2019 08:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <pull-1566599057-142651@atomide.com>
In-Reply-To: <pull-1566599057-142651@atomide.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 4 Sep 2019 17:26:20 +0200
Message-ID: <CAK8P3a1Hh8nFe7h0Jr7tf_aoarvwr3utD7LrFf9rV_OePL-+Zg@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] ti-sysc driver changes for v5.3
To:     Tony Lindgren <tony@atomide.com>
Cc:     SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Aug 24, 2019 at 12:24 AM Tony Lindgren <tony@atomide.com> wrote:
> Driver changes for ti-sysc for v5.4
>
> Few changes to prepare for using a reset driver for PRM rstctrl mostly
> to deal with the clocks for reset. Then few minor clean-up patches and
> SPDX license identifier changes, and add a MAINTAINERs file entry.

Pulled this one into an arm/late branch, together with the three
other pull requests that depend on this one.

Don't worry about the arm/late name, I expect to send this off
together with the other branches, it's just easier for me to
describe what's in each of the top-level branches this way.

       Arnd
