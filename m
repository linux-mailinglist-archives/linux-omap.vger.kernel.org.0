Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98FE21C598D
	for <lists+linux-omap@lfdr.de>; Tue,  5 May 2020 16:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729366AbgEEOaX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 May 2020 10:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727785AbgEEOaX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 May 2020 10:30:23 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0367FC061A0F;
        Tue,  5 May 2020 07:30:23 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id r14so968320pfg.2;
        Tue, 05 May 2020 07:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/8ydx1OQ+D7IiH04ZB0o6wh3QFLRJGOF1BFo03aMjE0=;
        b=Vz5o8n1cIrMmoGP44Q46Zmp0HCKTGVL6iSF8j/jpP+jsAwG2FzRJOfqClcI3JFfmIL
         VVD5IleJMQZXj13SdtF2r6cI0s13BqDa5RMBeC/I162mPJrW54BKbV9HSfCLMcDexZij
         LeTo1mFhwp6asz6sKuuLUX8UP5WPTN6N6PkU3EFJkGN98n0Gi+xTTKLopwxSdxr+vOKE
         HxBhiq8nV6SAvixOSrpMVtSDIaWDat6asa/2G7DxMbBy745Rv0Ccvfvgg8BbrPhKOLh7
         OpPX+31VkVkC/LVUqL+18lYlS13egiSbwNvHYLzf6mYkRTlATOOT4keTyrvbgMmIQaDc
         zHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/8ydx1OQ+D7IiH04ZB0o6wh3QFLRJGOF1BFo03aMjE0=;
        b=ThCEkcKctZuc+6cH5uRIuraFDwi2kiqmB6gHh6/hybUc5tA+8DLvt9BvDlS/FC2vBt
         I7xPi+NiC/knWXOE13YlzYHd8zYGGKYguPuF+R0jXqUZks2SklpBpMwWIHy9oJJ+LOtG
         ThEXSfQHo5nagX1ibeN32+IBwi07RrlzdZ364kPLEtD/bUiz7G1MdfOppLAVQSI6/EXZ
         sj05IUCjLleS0XRWWheDQf3s7+uMfwQbZxZX0GabjvvgGD4DJRTYVtkgLT4OGYmnQdvP
         Cl1WtohgH0ZgnJi8bHSpOIx0UOZ4DP1gm29oBDdYFU44KKnw9oQ6x9FvebubDWNO+vvO
         v6+A==
X-Gm-Message-State: AGi0PubX7sEJS2nNhh5f3iFB5mQ7PXVrSDBW5Gu9qcFlYM1uGA0BvOO0
        RDEmRYwXLSERv/6f3I3z7vY=
X-Google-Smtp-Source: APiQypJ9VDBm38O+rpfRbbRf4g5lKVbtUGdAU5GjiMUuycn6ou/4sv+IOjnuV2xTcLQTRwBKy1xcWQ==
X-Received: by 2002:a62:6385:: with SMTP id x127mr3582714pfb.276.1588689022537;
        Tue, 05 May 2020 07:30:22 -0700 (PDT)
Received: from localhost ([49.207.51.154])
        by smtp.gmail.com with ESMTPSA id j2sm2304373pfb.73.2020.05.05.07.30.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 May 2020 07:30:19 -0700 (PDT)
Date:   Tue, 5 May 2020 20:00:17 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Kevin Hilman <khilman@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: omap1: fix irq setup
Message-ID: <20200505143017.GA5263@afzalpc>
References: <20200505141400.767312-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505141400.767312-1-arnd@arndb.de>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Tue, May 05, 2020 at 04:13:48PM +0200, Arnd Bergmann wrote:

> A recent cleanup introduced a bug on any omap1 machine that has
> no wakeup IRQ, i.e. omap15xx:

> Move this code into a separate function to deal with it cleanly.
> 
> Fixes: b75ca5217743 ("ARM: OMAP: replace setup_irq() by request_irq()")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Sorry for the mistake and thanks for the fix,

Acked-by: afzal mohammed <afzal.mohd.ma@gmail.com>

Regards
afzal
