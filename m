Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 600A2A8987
	for <lists+linux-omap@lfdr.de>; Wed,  4 Sep 2019 21:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729649AbfIDP1M (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Sep 2019 11:27:12 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:40997 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfIDP1M (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Sep 2019 11:27:12 -0400
Received: by mail-qk1-f193.google.com with SMTP id o11so585374qkg.8
        for <linux-omap@vger.kernel.org>; Wed, 04 Sep 2019 08:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QjzLrloPSj0dq2PlM8GLX2EAvMaEi66BXUAo/AtPzMs=;
        b=XiaOAqRojmTz0P9xcgcO7S7j7NrhTx3qFJ94VPiOBSpQsDDSuzlymoW4i7k/+qXLD/
         WhPippp2DzPnVeKqslAzOqsJGTLPO/X7cKs32nSnZ3xXqHOkBst7onO/436O84tYYXYE
         mLE2IA5Dw48G5XBRHD56YfqNJIbk+Jf4P147DjqHumTAf3SWcZDf3JvQ1pnqIKhF9zHJ
         0tdr0c3CfjMO/RqJrS7/x0VwsLV3rm17zwGJTwt/dPoNiV+PIztoqMUd0Ibmd6ZDwGSc
         oZcPnntzTxV0LykTuygZGQt/7QreeZS2BJ9EmfPZVGSw8+TgJWIFi5m3H5YbECN8+S/z
         IyXg==
X-Gm-Message-State: APjAAAXv1EpD2jTykCZ3/5le1iPYAVQe5Tarn+lOzNRCz7JQUIEmoLix
        FS1A8RVbzCQKRnYvJqDiDd/DTwxswe1nVzZ3PZc=
X-Google-Smtp-Source: APXvYqy07NlVOWiPJc5VipU5GItcVxjI3NfPurtTfcV1/BbuNAzDvNqFIzyT1G8w73R1bNCrsmSc+6PwKLYbSE5QM+8=
X-Received: by 2002:a37:4b0d:: with SMTP id y13mr39385271qka.3.1567610831069;
 Wed, 04 Sep 2019 08:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <pull-1567016893-318461@atomide.com> <pull-1567016893-318461@atomide.com-2>
In-Reply-To: <pull-1567016893-318461@atomide.com-2>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 4 Sep 2019 17:26:55 +0200
Message-ID: <CAK8P3a27NB+8cz=dF5nSL_bACV5HDuUZLoZFUEvjjs7M6Oqm5g@mail.gmail.com>
Subject: Re: [GIT PULL 2/4] more ti-sysc driver changes for v5.4
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
> more ti-sysc driver changes for omap variants for v5.4
>
> Few changes mostly to deal with sgx SoC glue quirk for omap36xx that
> is needed for the related sgx SoC glue dts branch. The other changes
> are to simplify sysc_check_one_child() sysc_check_children() to be void
> functions, and detect d2d module when debugging is enabled.

Pulled into arm/late, thanks!

     Arnd
