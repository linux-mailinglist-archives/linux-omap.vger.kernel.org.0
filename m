Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0CE7156E0D
	for <lists+linux-omap@lfdr.de>; Mon, 10 Feb 2020 04:42:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgBJDm5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 9 Feb 2020 22:42:57 -0500
Received: from mga03.intel.com ([134.134.136.65]:22335 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726950AbgBJDm5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 9 Feb 2020 22:42:57 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Feb 2020 19:42:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,423,1574150400"; 
   d="scan'208";a="251064097"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Feb 2020 19:42:55 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j0zyI-0008VI-Ou; Mon, 10 Feb 2020 11:42:54 +0800
Date:   Mon, 10 Feb 2020 11:42:28 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Jassi Brar <jaswinder.singh@linaro.org>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: [balbi-usb:testing/next 3/10]
 drivers/usb/gadget/udc/max3420_udc.c:555:41: sparse: sparse: restricted
 __le16 degrades to integer
Message-ID: <202002101123.bbPtQpUy%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git testing/next
head:   b081f1dc121c0bdeacc45cf02c35d1ee95120680
commit: 2f6f2b1b48da8920dd0f73e27c0c644099a4bf4e [3/10] usb: gadget: add udc driver for max3420
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-162-g98276e61-dirty
        git checkout 2f6f2b1b48da8920dd0f73e27c0c644099a4bf4e
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/usb/gadget/udc/max3420_udc.c:555:41: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/max3420_udc.c:556:31: sparse: sparse: restricted __le16 degrades to integer
>> drivers/usb/gadget/udc/max3420_udc.c:570:16: sparse: sparse: incorrect type in assignment (different base types)
>> drivers/usb/gadget/udc/max3420_udc.c:570:16: sparse:    expected unsigned short [assigned] [usertype] status
>> drivers/usb/gadget/udc/max3420_udc.c:570:16: sparse:    got restricted __le16 [usertype]
   drivers/usb/gadget/udc/max3420_udc.c:588:31: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/max3420_udc.c:602:32: sparse: sparse: restricted __le16 degrades to integer
>> drivers/usb/gadget/udc/max3420_udc.c:631:29: sparse: sparse: cast from restricted __le16
   drivers/usb/gadget/udc/max3420_udc.c:632:29: sparse: sparse: cast from restricted __le16
   drivers/usb/gadget/udc/max3420_udc.c:633:30: sparse: sparse: cast from restricted __le16

vim +555 drivers/usb/gadget/udc/max3420_udc.c

   538	
   539	static void max3420_getstatus(struct max3420_udc *udc)
   540	{
   541		struct max3420_ep *ep;
   542		u16 status = 0;
   543	
   544		switch (udc->setup.bRequestType & USB_RECIP_MASK) {
   545		case USB_RECIP_DEVICE:
   546			/* Get device status */
   547			status = udc->gadget.is_selfpowered << USB_DEVICE_SELF_POWERED;
   548			status |= (udc->remote_wkp << USB_DEVICE_REMOTE_WAKEUP);
   549			break;
   550		case USB_RECIP_INTERFACE:
   551			if (udc->driver->setup(&udc->gadget, &udc->setup) < 0)
   552				goto stall;
   553			break;
   554		case USB_RECIP_ENDPOINT:
 > 555			ep = &udc->ep[udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK];
   556			if (udc->setup.wIndex & USB_DIR_IN) {
   557				if (!ep->ep_usb.caps.dir_in)
   558					goto stall;
   559			} else {
   560				if (!ep->ep_usb.caps.dir_out)
   561					goto stall;
   562			}
   563			if (ep->halted)
   564				status = 1 << USB_ENDPOINT_HALT;
   565			break;
   566		default:
   567			goto stall;
   568		}
   569	
 > 570		status = cpu_to_le16(status);
   571		spi_wr_buf(udc, MAX3420_REG_EP0FIFO, &status, 2);
   572		spi_wr8_ack(udc, MAX3420_REG_EP0BC, 2, 1);
   573		return;
   574	stall:
   575		dev_err(udc->dev, "Can't respond to getstatus request\n");
   576		spi_wr8(udc, MAX3420_REG_EPSTALLS, STLEP0IN | STLEP0OUT | STLSTAT);
   577	}
   578	
   579	static void max3420_set_clear_feature(struct max3420_udc *udc)
   580	{
   581		struct max3420_ep *ep;
   582		int set = udc->setup.bRequest == USB_REQ_SET_FEATURE;
   583		unsigned long flags;
   584		int id;
   585	
   586		switch (udc->setup.bRequestType) {
   587		case USB_RECIP_DEVICE:
   588			if (udc->setup.wValue != USB_DEVICE_REMOTE_WAKEUP)
   589				break;
   590	
   591			if (udc->setup.bRequest == USB_REQ_SET_FEATURE)
   592				udc->remote_wkp = 1;
   593			else
   594				udc->remote_wkp = 0;
   595	
   596			return spi_ack_ctrl(udc);
   597	
   598		case USB_RECIP_ENDPOINT:
   599			if (udc->setup.wValue != USB_ENDPOINT_HALT)
   600				break;
   601	
   602			id = udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK;
   603			ep = &udc->ep[id];
   604	
   605			spin_lock_irqsave(&ep->lock, flags);
   606			ep->todo &= ~STALL_EP;
   607			if (set)
   608				ep->todo |= STALL;
   609			else
   610				ep->todo |= UNSTALL;
   611			spin_unlock_irqrestore(&ep->lock, flags);
   612	
   613			spi_max3420_stall(ep);
   614			return;
   615		default:
   616			break;
   617		}
   618	
   619		dev_err(udc->dev, "Can't respond to SET/CLEAR FEATURE\n");
   620		spi_wr8(udc, MAX3420_REG_EPSTALLS, STLEP0IN | STLEP0OUT | STLSTAT);
   621	}
   622	
   623	static void max3420_handle_setup(struct max3420_udc *udc)
   624	{
   625		struct usb_ctrlrequest setup;
   626		u8 addr;
   627	
   628		spi_rd_buf(udc, MAX3420_REG_SUDFIFO, (void *)&setup, 8);
   629	
   630		udc->setup = setup;
 > 631		udc->setup.wValue = cpu_to_le16(setup.wValue);
   632		udc->setup.wIndex = cpu_to_le16(setup.wIndex);
   633		udc->setup.wLength = cpu_to_le16(setup.wLength);
   634	
   635		switch (udc->setup.bRequest) {
   636		case USB_REQ_GET_STATUS:
   637			/* Data+Status phase form udc */
   638			if ((udc->setup.bRequestType &
   639					(USB_DIR_IN | USB_TYPE_MASK)) !=
   640					(USB_DIR_IN | USB_TYPE_STANDARD)) {
   641				break;
   642			}
   643			return max3420_getstatus(udc);
   644		case USB_REQ_SET_ADDRESS:
   645			/* Status phase from udc */
   646			if (udc->setup.bRequestType != (USB_DIR_OUT |
   647					USB_TYPE_STANDARD | USB_RECIP_DEVICE)) {
   648				break;
   649			}
   650			addr = spi_rd8_ack(udc, MAX3420_REG_FNADDR, 1);
   651			dev_dbg(udc->dev, "Assigned Address=%d\n", udc->setup.wValue);
   652			return;
   653		case USB_REQ_CLEAR_FEATURE:
   654		case USB_REQ_SET_FEATURE:
   655			/* Requests with no data phase, status phase from udc */
   656			if ((udc->setup.bRequestType & USB_TYPE_MASK)
   657					!= USB_TYPE_STANDARD)
   658				break;
   659			return max3420_set_clear_feature(udc);
   660		default:
   661			break;
   662		}
   663	
   664		if (udc->driver->setup(&udc->gadget, &setup) < 0) {
   665			/* Stall EP0 */
   666			spi_wr8(udc, MAX3420_REG_EPSTALLS,
   667				STLEP0IN | STLEP0OUT | STLSTAT);
   668		}
   669	}
   670	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
