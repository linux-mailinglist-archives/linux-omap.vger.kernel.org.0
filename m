Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29DE2732A5
	for <lists+linux-omap@lfdr.de>; Wed, 24 Jul 2019 17:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbfGXPWV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Jul 2019 11:22:21 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50158 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfGXPWU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 24 Jul 2019 11:22:20 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6OFMD9Z064348;
        Wed, 24 Jul 2019 10:22:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563981733;
        bh=A6A0bXG2C/Uz5DrM46M0ff+/GH1i3euz7a1rC7d3MCQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=eddzfZNZBkv+Tu+z5M30SOSEkjDHFKO4d9jxmIffAurnG/EUEWqou4X8AU2ME1nHu
         dpI+QL0LfT+N8D8mW9+oH1Ln/w+ms5aitgjyNEzF604CPLXMiTENMkpiOCgcjncV3E
         oNcoNH2pi9HQC01bvjQnCol/EDvUPp+eHtQL+sAY=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6OFMDfx088896
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 24 Jul 2019 10:22:13 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 24
 Jul 2019 10:22:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 24 Jul 2019 10:22:13 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6OFMCMW029577;
        Wed, 24 Jul 2019 10:22:12 -0500
Subject: Re: Backlight in motorola Droid 4
To:     Pavel Machek <pavel@ucw.cz>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <sre@kernel.org>,
        <nekit1000@gmail.com>, <mpartap@gmx.net>, <merlijn@wizzup.org>,
        <jacek.anaszewski@gmail.com>, <linux-kernel@vger.kernel.org>,
        <linux-leds@vger.kernel.org>
References: <20181219162626.12297-1-dmurphy@ti.com>
 <20190722205921.GA24787@amd> <b8fbc94f-c087-2c9d-4532-ea423f1626e6@ti.com>
 <20190724124530.GA30211@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <ca69f627-96e2-f982-3a29-18b0127ac6e5@ti.com>
Date:   Wed, 24 Jul 2019 10:22:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190724124530.GA30211@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Pavel

On 7/24/19 7:45 AM, Pavel Machek wrote:
<snip>
>
> +
>   static int lm3532_parse_node(struct lm3532_data *priv)
>   {
>   	struct fwnode_handle *child = NULL;
> @@ -536,11 +579,13 @@ static int lm3532_parse_node(struct lm3532_data *priv)
>   		ret = fwnode_property_read_u32(child, "ti,led-mode",
>   					       &led->mode);
>   		if (ret) {
> +		  /* FIXME: should just default to non-als mod */

Looking at the rest of the code.

The DT doc indicated that this was a required child property so this is 
why it

errors out.

Dan

<snip>


